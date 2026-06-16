.class public final Ld/a/b/g/l/d/b;
.super Ljava/lang/Object;
.source "DefaultCheckCallback.java"

# interfaces
.implements Ld/a/b/g/l/c/a;


# instance fields
.field public a:Ld/a/b/g/l/a;

.field public b:Ld/a/b/g/l/c/a;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 15
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_e

    .line 16
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0}, Ld/a/b/g/l/c/a;->a()V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception v0

    .line 17
    invoke-virtual {p0, v0}, Ld/a/b/g/l/d/b;->b(Ljava/lang/Throwable;)V

    :cond_e
    :goto_e
    return-void
.end method

.method public a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/d/b;->a:Ld/a/b/g/l/a;

    .line 2
    invoke-virtual {p1}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object p1

    iput-object p1, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    return-void
.end method

.method public a(Ld/a/b/g/l/f/b;)V
    .registers 5

    .line 3
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_9

    .line 4
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->a(Ld/a/b/g/l/f/b;)V

    .line 5
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/d/b;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->d()Ld/a/b/g/l/c/b;

    move-result-object v0

    .line 6
    iget-object v1, p0, Ld/a/b/g/l/d/b;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/b;->a(Ld/a/b/g/l/a;)V

    .line 7
    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/b;->a(Ld/a/b/g/l/f/b;)V

    .line 8
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v1

    invoke-virtual {v1}, Ld/a/b/g/l/g/a;->c()Landroid/app/Activity;

    move-result-object v1

    .line 9
    invoke-static {v1}, Ld/a/b/g/l/g/e;->a(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_39

    iget-object v2, p0, Ld/a/b/g/l/d/b;->a:Ld/a/b/g/l/a;

    .line 10
    invoke-virtual {v2}, Ld/a/b/g/l/a;->p()Ld/a/b/g/l/c/n;

    move-result-object v2

    invoke-virtual {v2, p1}, Ld/a/b/g/l/c/n;->a(Ld/a/b/g/l/f/b;)Z

    move-result p1

    if-eqz p1, :cond_39

    .line 11
    invoke-virtual {v0, v1}, Ld/a/b/g/l/c/b;->a(Landroid/app/Activity;)Landroid/app/Dialog;

    move-result-object p1

    .line 12
    invoke-static {p1}, Ld/a/b/g/l/g/c;->c(Landroid/app/Dialog;)V

    goto :goto_41

    .line 13
    :cond_39
    invoke-virtual {v0}, Ld/a/b/g/l/c/b;->a()V
    :try_end_3c
    .catchall {:try_start_0 .. :try_end_3c} :catchall_3d

    goto :goto_41

    :catchall_3d
    move-exception p1

    .line 14
    invoke-virtual {p0, p1}, Ld/a/b/g/l/d/b;->b(Ljava/lang/Throwable;)V

    :goto_41
    return-void
.end method

.method public b(Ld/a/b/g/l/f/b;)V
    .registers 3

    .line 4
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_e

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->b(Ld/a/b/g/l/f/b;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception p1

    .line 6
    invoke-virtual {p0, p1}, Ld/a/b/g/l/d/b;->b(Ljava/lang/Throwable;)V

    :cond_e
    :goto_e
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .registers 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_e

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0, p1}, Ld/a/b/g/l/c/a;->b(Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception p1

    .line 3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_e
    :goto_e
    return-void
.end method

.method public c()V
    .registers 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_e

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0}, Ld/a/b/g/l/c/a;->c()V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception v0

    .line 3
    invoke-virtual {p0, v0}, Ld/a/b/g/l/d/b;->b(Ljava/lang/Throwable;)V

    :cond_e
    :goto_e
    return-void
.end method

.method public d()V
    .registers 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_e

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/d/b;->b:Ld/a/b/g/l/c/a;

    invoke-interface {v0}, Ld/a/b/g/l/c/a;->d()V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_e

    :catchall_a
    move-exception v0

    .line 3
    invoke-virtual {p0, v0}, Ld/a/b/g/l/d/b;->b(Ljava/lang/Throwable;)V

    :cond_e
    :goto_e
    return-void
.end method
