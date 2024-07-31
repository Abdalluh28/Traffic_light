import './App.css';
import { createBrowserRouter, createRoutesFromElements, Route, RouterProvider } from 'react-router-dom';
import RootLayout from './components/RootLayout';
import Home from './pages/Home';
import Login from './pages/auth/Login';
import Register from './pages/auth/Register';
import Dashboard from './pages/Dashboard';

function App() {


  const router = createBrowserRouter(createRoutesFromElements(
    <Route path="/" element={<RootLayout />}>
      <Route index element={<Home />} />
      <Route path='auth'>
        <Route path='login' element={<Login />} />
        <Route path='register' element={<Register />} />
      </Route>
      <Route path='Dashboard' element={<Dashboard />} />
    </Route>
  ))


  return <RouterProvider router={router} />
}

export default App;
