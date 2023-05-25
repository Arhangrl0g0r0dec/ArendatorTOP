using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArendatorTOP.ViewModel
{
    class MaterialViewModel:ViewModelBase
    {
        public ObservableCollection<Materials> Materials { get; set; }
        public List<TypeOfMaterial> TypeMaterials = new List<TypeOfMaterial>();
        public TypeOfMaterial typeOfMaterial { get; set; }

        public string SearchString { get; set; }
        public MaterialViewModel() 
        {
            Title = "Материалы";
            Materials = new ObservableCollection<Materials>();
            TypeMaterials = DBModel.GetContext().TypeOfMaterial.ToList();
            UpdateMaterialsList();
        }

        public ObservableCollection<Materials> UpdateMaterialsList() 
        {
            Materials.Clear();
            List<Materials> materials = new List<Materials>();
            materials = DBModel.GetContext().Materials.ToList();

            if (!String.IsNullOrEmpty(SearchString)) 
            {
                materials = materials.Where(p => p.Title.ToLower().Contains(SearchString.ToLower()) || p.TypeOfMaterial.Title.ToLower().Contains(SearchString)).ToList();
            }

            if(typeOfMaterial != null) 
            {
                materials = materials.Where(p => p.TypeOfMaterial == typeOfMaterial).ToList() ;
            }

            foreach (var material in materials)
            {
                Materials.Add(material);
            }
            return Materials;
        }

        public List<TypeOfMaterial> GetOfMaterials() 
        {
            return TypeMaterials;
        }
    }
}
