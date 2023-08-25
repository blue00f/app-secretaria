import teachersData from './teachersList.json';

function ListOfTeachers(){

    return(
        <section className="p-40 border border-black-300 text-center">
            <div className="flex">
                <h1 className="mr-4">Lista de Profesores</h1>
                <button className="bg-black hover:bg-gray-700 text-white font-bold py-2 px-4 border-b-4 border-black hover:border-gray-700 rounded">
                Agregar Profesores
                </button>
            </div>
            <div>
                
                    <div className="grid grid-cols-4 "> 
                        <p>ID</p>
                        <p>Nombre</p>
                        <p>Apellido</p>
                        <p>DNI</p>
                    </div>
        {teachersData.map((teacher, index) => (
          <div
            key={index}
            className="grid grid-cols-4 bg-gray-300 border border-black-300 rounded-md p-2.5"
          >
            
            <p>{index}</p>
            <p>{teacher.nombre}</p>
            <p>{teacher.apellido}</p>
            <p>{teacher.dni}</p>
          </div>
        ))}
            </div>

        </section>
    )
}

export default ListOfTeachers;
    



