import SwiftUI
struct GroupView: View {
    // Mock data for the group details and discussion posts
    let groupDetails = GroupDetails(
        groupName: "50 Tons de Cinza",
        creator: "@augusto_villa",
        description: "Esse é o camaleão da sorte. Quem terminar por último deve enviar esse camaleão para...",
        progressPercentage: 73.0
    )
    let discussionPosts = [
        DiscussionPost(
            username: "@pedroA_Kbral",
            content: "Gastei todos os meus marcadores nesse livro. Cada página tem uma frase impactante."
        ),
        DiscussionPost(
            username: "@AnaMargarida",
            content: "Estou impressionada com a profundidade dos personagens. Recomendo!"
        )
    ]
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundBase
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        // Group Details Section
                        HStack {
                            Image("camaleao") // Use the image from Assets.xcassets
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(groupDetails.groupName)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("criado por \(groupDetails.creator)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(groupDetails.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                                    .padding(.top, 4)
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(width: 344, height: 120, alignment: .center)
                        .background(Color("Background"))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        // Progress Section
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                                .padding(.trailing, 4)
                            Text("Você está liderando: \(Int(groupDetails.progressPercentage))% lido!")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .frame(width: 300, height: 40, alignment: .center)
                        .background(Color("Background"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Hover"), lineWidth: 2)
                        )
                        .cornerRadius(10)
                        .padding(.horizontal)
                        // Discussion Section
                        Text("Discussão")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .offset(x: -120)
                        ForEach(discussionPosts, id: \.self) { post in
                            DiscussionPostView(post: post)
                                .padding(.horizontal)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Camaleão Daltônico")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
        .accentColor(.red)
    }
}

// Custom View for Discussion Post
struct DiscussionPostView: View {
    let post: DiscussionPost
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.username)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(post.content)
                .font(.body)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color("Background"))
        .cornerRadius(10)
    }
}
// Mock Models
struct GroupDetails {
    let groupName: String
    let creator: String
    let description: String
    let progressPercentage: Double
}
struct DiscussionPost: Hashable {
    let username: String
    let content: String
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
            .colorScheme(.light)
    }
}
