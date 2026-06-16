.class public final Ld/a/b/g/l/d/c;
.super Ljava/lang/Object;
.source "DefaultDownloadCallback.java"

# interfaces
.implements Ld/a/b/g/l/c/d;


# instance fields
.field public a:Ld/a/b/g/l/a;

.field public b:Ld/a/b/g/l/c/d;

.field public c:Ld/a/b/g/l/f/b;

.field public d:Ld/a/b/g/l/c/d;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Ld/a/b/g/l/d/c;)Ld/a/b/g/l/f/b;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/d/c;->c:Ld/a/b/g/l/f/b;

    return-object p0
.end method

.method public static synthetic b(Ld/a/b/g/l/d/c;)Ld/a/b/g/l/a;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    return-object p0
.end method


# virtual methods
.method public final a()Ld/a/b/g/l/c/d;
    .registers 5

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    if-nez v0, :cond_37

    iget-object v0, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->p()Ld/a/b/g/l/c/n;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/c/n;->b()Z

    move-result v0

    if-nez v0, :cond_11

    goto :goto_37

    .line 6
    :cond_11
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/g/a;->c()Landroid/app/Activity;

    move-result-object v0

    .line 7
    invoke-static {v0}, Ld/a/b/g/l/g/e;->a(Landroid/app/Activity;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 8
    iget-object v1, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    invoke-virtual {v1}, Ld/a/b/g/l/a;->h()Ld/a/b/g/l/c/e;

    move-result-object v1

    iget-object v2, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    iget-object v3, p0, Ld/a/b/g/l/d/c;->c:Ld/a/b/g/l/f/b;

    invoke-virtual {v1, v2, v3}, Ld/a/b/g/l/c/e;->a(Ld/a/b/g/l/a;Ld/a/b/g/l/f/b;)Ld/a/b/g/l/c/e;

    iget-object v2, p0, Ld/a/b/g/l/d/c;->c:Ld/a/b/g/l/f/b;

    invoke-virtual {v1, v2, v0}, Ld/a/b/g/l/c/e;->a(Ld/a/b/g/l/f/b;Landroid/app/Activity;)Ld/a/b/g/l/c/d;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    .line 9
    :cond_34
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    return-object v0

    .line 10
    :cond_37
    :goto_37
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    return-object v0
.end method

.method public a(JJ)V
    .registers 6

    .line 16
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_9

    .line 17
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1, p2, p3, p4}, Ld/a/b/g/l/c/d;->a(JJ)V

    .line 18
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_17

    .line 19
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1, p2, p3, p4}, Ld/a/b/g/l/c/d;->a(JJ)V
    :try_end_12
    .catchall {:try_start_0 .. :try_end_12} :catchall_13

    goto :goto_17

    :catchall_13
    move-exception p1

    .line 20
    invoke-virtual {p0, p1}, Ld/a/b/g/l/d/c;->a(Ljava/lang/Throwable;)V

    :cond_17
    :goto_17
    return-void
.end method

.method public a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    .line 3
    invoke-virtual {p1}, Ld/a/b/g/l/a;->g()Ld/a/b/g/l/c/d;

    move-result-object p1

    iput-object p1, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    return-void
.end method

.method public a(Ld/a/b/g/l/f/b;)V
    .registers 2

    .line 4
    iput-object p1, p0, Ld/a/b/g/l/d/c;->c:Ld/a/b/g/l/f/b;

    return-void
.end method

.method public a(Ljava/io/File;)V
    .registers 3

    .line 11
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_9

    .line 12
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/io/File;)V

    .line 13
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_17

    .line 14
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/io/File;)V
    :try_end_12
    .catchall {:try_start_0 .. :try_end_12} :catchall_13

    goto :goto_17

    :catchall_13
    move-exception p1

    .line 15
    invoke-virtual {p0, p1}, Ld/a/b/g/l/d/c;->a(Ljava/lang/Throwable;)V

    :cond_17
    :goto_17
    return-void
.end method

.method public a(Ljava/lang/Throwable;)V
    .registers 3

    .line 21
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_9

    .line 22
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/lang/Throwable;)V

    .line 23
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_17

    .line 24
    iget-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/d;->a(Ljava/lang/Throwable;)V
    :try_end_12
    .catchall {:try_start_0 .. :try_end_12} :catchall_13

    goto :goto_17

    :catchall_13
    move-exception p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_17
    :goto_17
    return-void
.end method

.method public b()V
    .registers 2

    .line 2
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_9

    .line 3
    iget-object v0, p0, Ld/a/b/g/l/d/c;->b:Ld/a/b/g/l/c/d;

    invoke-interface {v0}, Ld/a/b/g/l/c/d;->b()V

    .line 4
    :cond_9
    invoke-virtual {p0}, Ld/a/b/g/l/d/c;->a()Ld/a/b/g/l/c/d;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/d/c;->d:Ld/a/b/g/l/c/d;

    if-eqz v0, :cond_19

    .line 5
    invoke-interface {v0}, Ld/a/b/g/l/c/d;->b()V
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_15

    goto :goto_19

    :catchall_15
    move-exception v0

    .line 6
    invoke-virtual {p0, v0}, Ld/a/b/g/l/d/c;->a(Ljava/lang/Throwable;)V

    :cond_19
    :goto_19
    return-void
.end method

.method public b(Ljava/io/File;)V
    .registers 5

    .line 7
    iget-object v0, p0, Ld/a/b/g/l/d/c;->a:Ld/a/b/g/l/a;

    .line 8
    invoke-static {}, Ld/a/b/g/l/g/e;->a()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Ld/a/b/g/l/d/c$a;

    invoke-direct {v2, p0, v0, p1}, Ld/a/b/g/l/d/c$a;-><init>(Ld/a/b/g/l/d/c;Ld/a/b/g/l/a;Ljava/io/File;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
