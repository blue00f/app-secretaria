function AddTeacher() {
    return (
      <header className="flex justify-between items-center my-4">
        <div className="pl-8">
          <h1 className="text-2xl">Lista de Profesores</h1>
        </div>
        <div className="pr-6">
          <button className=" bg-black w-72 hover:bg-gray-700 text-white font-bold py-2 px-4 border-b-4 border-black hover:border-gray-700 rounded">
            Agregar Profesores
          </button>
        </div>
      </header>
    )
  }
  
  export default AddTeacher
  