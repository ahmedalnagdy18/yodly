const String categories = r"""
query categories {
  categories{
    
    data{
      id
      enName
      subcategories{
        id
        enName
        
      }
      
    }
    code
    success
    message
  }
}
""";
const String createReview = r"""
mutation createReview($input:CreateReviewInput!){
  createReview(input:$input){
    data{
      id
      title
      description
      name
      overallRating
      
      attachments{
          attachmentType
          link
        }
    } 
    code
    success
    message
    
  }
}
""";
