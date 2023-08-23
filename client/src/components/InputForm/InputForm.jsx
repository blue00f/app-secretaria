import { useHandleSubmit } from "../Hooks/useHandleSubmit"

function InputForm() {
  const { handleSubmit } = useHandleSubmit()

  return (
    <section className="max-w-full border border-black-300 p-2 text-center">
      <form onSubmit={handleSubmit} className="grid grid-cols-4">
        <div className="ml-16">
          <label htmlFor="" className="font-medium text-gray-700 mr-3">
            Nombre
          </label>
          <input
            type="text"
            name="Nombre"
            className="mt-1 px-4 py-2 border rounded-md focus:ring focus:ring-violet-300 focus:outline-none"
          />
        </div>

        <div className=" ml-16 ">
          <label htmlFor="" className="font-medium text-gray-700 mr-3">
            Apellido
          </label>
          <input
            type="text"
            className="mt-1 px-4 py-2 border rounded-md focus:ring focus:ring-violet-300 focus:outline-none"
            name="Apellido"
          />
        </div>

        <div className="ml-16">
          <label htmlFor="" className="font-medium text-gray-700 mr-3">
            Documento
          </label>
          <input
            type="text"
            className="mt-1 px-4 py-2 border rounded-md focus:ring focus:ring-violet-300 focus:outline-none"
            name="Documento"
          />
        </div>
        <button className="w-32 ml-40 bg-black hover:bg-gray-700 text-white font-bold py-2 px-4 border-b-4 border-black hover:border-gray-700 rounded">
          Buscar
        </button>
      </form>
    </section>
  )
}

export default InputForm
