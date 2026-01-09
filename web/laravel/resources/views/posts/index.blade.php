<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$title}}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
        }

        .header h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 16px;
        }

        .posts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
        }

        .post-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 5px solid #bcd9e4;
        }

        .post-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            border-left-color: #97c4d3;
        }

        .post-title {
            font-size: 22px;
            color: #333;
            margin-bottom: 12px;
            font-weight: 600;
            line-height: 1.4;
        }

        .post-content {
            color: #666;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .post-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #eee;
            font-size: 14px;
        }

        .post-author {
            color: #bcd9e4;
            font-weight: 600;
            background: #f0f8fa;
            padding: 5px 12px;
            border-radius: 20px;
        }

        .post-views {
            color: #999;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .post-views::before {
            content: '👁';
            font-size: 16px;
        }

        .post-date {
            color: #999;
            font-size: 13px;
            margin-top: 10px;
        }

        .stats {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .empty-state {
            background: white;
            padding: 60px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }

        .empty-state h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .empty-state p {
            color: #999;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .posts-grid {
                grid-template-columns: 1fr;
            }

            .header h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1> Post List </h1>
        <p> All {{ count($posts)  }} 개의 Posts List 있습니다.</p>
    </div>

    <div class="posts-grid">
    @foreach($posts as $post)
        <div class="post-card">
            <h2 class="post-title">{{$post->title}}</h2>
            <p class="post-content">{{$post->content}}</p>

            <div class="post-meta">
                <span class="post-author"> {{$post->author}} </span>
                <div class="stats">
                    <span class="post-views"> {{$post->views}} </span>
                </div>
            </div>

            <div class="post-date">
                {{date('Y-m-d H:i', strtotime($post->created_at))}}
            </div>
        </div>
    @endforeach
    </div>
</div>
</body>
</html>
