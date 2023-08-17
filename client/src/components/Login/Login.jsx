function Login() {
  return (
    <div className="bg-gray-100 h-screen flex justify-center items-center">
      <div className="bg-white p-8 rounded shadow-md w-80">
        <div className="flex flex-col m-5">
          <img
            className="w-24 self-center"
            src="./escudo-colegio.png"
            alt="logo"
          />
        </div>

        <form>
          <div className="mb-4">
            <label
              for="username"
              className="block text-sm font-medium text-gray-700">
              Usuario
            </label>
            <input
              type="text"
              id="username"
              name="username"
              className="mt-1 px-4 py-2 w-full border rounded-md focus:ring focus:ring-violet-300 focus:outline-none"
            />
          </div>
          <div className="mb-4">
            <label
              for="password"
              className="block text-sm font-medium text-gray-700">
              Contraseña
            </label>
            <input
              type="password"
              id="password"
              name="password"
              className="mt-1 px-4 py-2 w-full border rounded-md focus:ring focus:ring-violet-300 focus:outline-none"
            />
          </div>
          <div className="flex flex-col items-center justify-between">
            <button
              type="submit"
              className="bg-violet-950 text-white w-full py-2 rounded-md hover:bg-violet-900 focus:outline-none focus:ring focus:ring-violet-300">
              Iniciar sesión
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}

export default Login
