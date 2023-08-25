import teachersData from "./teachersList.json"

function ListOfTeachers() {
  return (
    <section className="p-20 border border-black-300 text-center">
      <div className=" bg-gray-200 p-5 rounded-md">
        <header className="flex justify-between items-center my-4">
          <div className="pl-6">
            <h1 className="text-2xl">Lista de Profesores</h1>
          </div>
          <div className="pr-6">
            <button className=" bg-black w-72 hover:bg-gray-700 text-white font-bold py-2 px-4 border-b-4 border-black hover:border-gray-700 rounded">
              Agregar Profesores
            </button>
          </div>
        </header>
        <div>
          <div className="grid grid-cols-4 text-lg">
            <p>ID</p>
            <p>Nombre</p>
            <p>Apellido</p>
            <p>DNI</p>
          </div>
          {teachersData.profesores.map((teacher, index) => (
            <div
              key={index}
              className="grid grid-cols-4 bg-white border border-black-300 rounded-md py-2.5">
              <p>{index}</p>
              <p>{teacher.nombre}</p>
              <p>{teacher.apellido}</p>
              <p>{teacher.dni}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default ListOfTeachers
