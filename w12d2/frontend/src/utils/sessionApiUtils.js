// WRITE FETCHES

export const postUser = userInfo => (
    fetch('/api/users', {
        method: 'post',
        body: JSON.stringify(userInfo),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': sessionStorage.getItem('X-CSRF-Token')
        }
    })
)

export const postSession = sessionInfo => (
    fetch('/api/session', {
        method: 'post',
        body: JSON.stringify(sessionInfo),
        headers: {
            'Content-Type' : 'application/json',
            'X-CSRF-Token': sessionStorage.getItem('X-CSRF-Token')
        }
    })
)
export const deleteSession = sessionInfo => (
    fetch('/api/session', {
        method: 'delete',
        body: JSON.stringify(sessionInfo),
        headers: {
            'X-CSRF-Token': sessionStorage.getItem('X-CSRF-Token')
        }
    })
)

