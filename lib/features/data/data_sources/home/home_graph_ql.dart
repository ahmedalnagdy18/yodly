const String reviewsQuery = r"""
query reviews($paginate:PaginatorInput,$filter:ReviewFilter){
  reviews(paginate:$paginate,filter:$filter){
    data{
      pageInfo{
        page
        limit
        totalCount
        totalPages
      }
      items{
        
        user{
          userName
        }
        id
        name
        description
        title
        country
        city
        specificRating{
          tag
          rating
        }
        attachments{
          attachmentType
          link
          
        }
      }
    }
    code
    message
    success
  }
}
""";

const String deleteReviewId = r"""
mutation deleteReview ($reviewId:ID!){
  deleteReview (reviewId:$reviewId){
    code
    success
    message
  }
}
""";
