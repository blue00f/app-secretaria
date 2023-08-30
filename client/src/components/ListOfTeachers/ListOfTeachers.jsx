import teachersData from "./teachersList.json"
import AddTeachers from "./AddTeachers"
function ListOfTeachers() {
  return (
    <section className="p-20 border border-black-300 text-center">
      <div className=" bg-gray-200 p-5 rounded-md">
        <AddTeachers/>
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
