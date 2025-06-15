# Guia para Geração de UI Flutter - Blog Católico

**Criado em:** 15 de junho de 2025, 11:59  
**Atualizado em:** 15 de junho de 2025, 11:59  
**Categoria:** Desenvolvimento Flutter  
**Tags:** Flutter, UI, Blog, JSON, Design System

## Estrutura do JSON para Blog

O arquivo JSON foi estruturado como um post de blog completo, facilitando a geração automática de uma UI Flutter moderna para um app de blog católico.

## 1. Metadados do Blog (`blog_post`)

### 1.1 Informações Básicas
```dart
class BlogPost {
  final String id;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool published;
  final bool featured;
  final int readingTime;
  final int wordCount;
  final String excerpt;
  
  // Use para lista de posts e detalhes
  BlogPost.fromJson(Map<String, dynamic> json)
    : id = json['blog_post']['id'],
      slug = json['blog_post']['slug'],
      createdAt = DateTime.parse(json['blog_post']['created_at']),
      // ... outros campos
}
```

### 1.2 Card de Post na Lista
```dart
Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Imagem destacada
      ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          post.featuredImage.url,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categoria e data
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(post.category.color),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    post.category.name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Spacer(),
                Text(
                  DateFormat('dd/MM/yyyy').format(post.createdAt),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Título
            Text(
              post.title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            // Excerpt
            Text(
              post.excerpt,
              style: TextStyle(color: Colors.grey[700]),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12),
            // Tags e tempo de leitura
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 4,
                    children: post.tags.take(2).map((tag) => Chip(
                      label: Text(tag.name, style: TextStyle(fontSize: 10)),
                      backgroundColor: Color(tag.color).withOpacity(0.1),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )).toList(),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      '${post.readingTime} min',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
)
```

## 2. Estrutura de Dados para Flutter

```dart
// models/blog_post.dart
class BlogPost {
  final String id;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool published;
  final bool featured;
  final Author author;
  final Category category;
  final List<Tag> tags;
  final int readingTime;
  final int wordCount;
  final String excerpt;
  final FeaturedImage featuredImage;
  final SEO seo;
  final PageContent page;
  
  BlogPost.fromJson(Map<String, dynamic> json) {
    // Parse do JSON completo
  }
}

class Author {
  final String name;
  final String role;
  
  Author.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      role = json['role'];
}

class Category {
  final String id;
  final String name;
  final String color;
  
  Category.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      color = json['color'];
}
```

## 3. Lista de Posts (Home do Blog)

```dart
class BlogHomePage extends StatelessWidget {
  final List<BlogPost> posts;
  final List<Category> categories;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Católico'),
        backgroundColor: Color(0xFF2D9B9B),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          // Posts em destaque
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              child: PageView.builder(
                itemCount: posts.where((p) => p.featured).length,
                itemBuilder: (context, index) {
                  final post = posts.where((p) => p.featured).elementAt(index);
                  return _buildFeaturedPostCard(post);
                },
              ),
            ),
          ),
          // Lista de posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildPostCard(posts[index]),
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
```

## 4. Rotina Git

Agora vou criar um script para automatizar o Git. 