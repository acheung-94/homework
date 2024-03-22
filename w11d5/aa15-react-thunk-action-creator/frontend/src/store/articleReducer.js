
const LOAD_ARTICLES = 'article/loadArticles';
const ADD_ARTICLE = 'article/addArticle';

export const loadArticles = (articles) => {
  return {
    type: LOAD_ARTICLES,
    articles
  };
};

export const addArticle = (article) => {
  return {
    type: ADD_ARTICLE,
    article
  };
};

export const fetchArticles = () => async (dispatch) => {
  let res = await fetch('/api/articles')

  if (res.ok) {
    let data = await res.json()
    dispatch(loadArticles(data))
    return data
  }
}

export const writeArticle = (article) => async dispatch => {
  let res = await fetch('/api/articles', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(article)
    })

  if (res.ok) {
    let data = await res.json()
    dispatch(addArticle(data))
    return data
  }
}

const initialState = { entries: [], isLoading: true };

const articleReducer = (state = initialState, action) => {
  switch (action.type) {
    case LOAD_ARTICLES:
      return { ...state, entries: [...action.articles] };
    case ADD_ARTICLE:
      return { ...state, entries: [...state.entries, action.article] };
    default:
      return state;
  }
};

export default articleReducer;
