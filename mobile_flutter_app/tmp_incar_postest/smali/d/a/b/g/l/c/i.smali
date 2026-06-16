.class public abstract Ld/a/b/g/l/c/i;
.super Ljava/lang/Object;
.source "InstallNotifier.java"


# instance fields
.field public a:Ld/a/b/g/l/a;

.field public b:Ld/a/b/g/l/f/b;

.field public c:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/app/Activity;)Landroid/app/Dialog;
.end method

.method public final a()V
    .registers 3

    .line 4
    iget-object v0, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-interface {v0, v1}, Ld/a/b/g/l/c/a;->b(Ld/a/b/g/l/f/b;)V

    .line 6
    :cond_13
    iget-object v0, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->e()I

    move-result v0

    invoke-static {v0}, Ld/a/b/g/l/g/d;->a(I)V

    return-void
.end method

.method public final a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    return-void
.end method

.method public final a(Ld/a/b/g/l/f/b;)V
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    return-void
.end method

.method public final a(Ljava/io/File;)V
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/c/i;->c:Ljava/io/File;

    return-void
.end method

.method public final b()V
    .registers 5

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->m()Ld/a/b/g/l/c/j;

    move-result-object v0

    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object v1

    invoke-virtual {v1}, Ld/a/b/g/l/g/a;->b()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Ld/a/b/g/l/c/i;->c:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ld/a/b/g/l/c/i;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0, v1, v2, v3}, Ld/a/b/g/l/c/j;->a(Landroid/content/Context;Ljava/lang/String;Ld/a/b/g/l/f/b;)V

    return-void
.end method

.method public final c()V
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/c/i;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object v0

    invoke-interface {v0}, Ld/a/b/g/l/c/a;->c()V

    :cond_11
    return-void
.end method
