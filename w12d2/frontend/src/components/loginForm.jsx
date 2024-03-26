import { useDispatch } from "react-redux"
import { loginUser } from "../store/sessionReducer"

const LoginForm = () => {
    const dispatch = useDispatch()
    const [formData, setFormData] = useState( {
        username: '',
        password: ''
     })

    const handleChange = field => e => {
        setFormData(old => ({...old, [field]: e.target.value}))
    }
    
    const handleSubmit = e => {
        e.preventDefault()
        dispatch(loginUser(formData))
    }
    return (
        <form onSubmit={handleSubmit}>
            <label>Username
                <input 
                    type="text"
                    value={formData.username}
                    onChange={handleChange('username')}
                />
            </label>
            <label>Password
                <input 
                    type="password" 
                    value={formData.password}
                    onChange={handleChange('password')}
                />
            </label>
            <button type="submit">Log In</button>
        </form>
    )

}

export default LoginForm