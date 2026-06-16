.class public abstract Ld/a/b/g/l/c/b;
.super Ljava/lang/Object;
.source "CheckNotifier.java"


# instance fields
.field public a:Ld/a/b/g/l/a;

.field public b:Ld/a/b/g/l/f/b;

.field public c:Ld/a/b/g/l/c/a;


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
    .registers 4

    .line 4
    invoke-static {}, Ld/a/b/g/l/d/d;->a()Ld/a/b/g/l/d/d;

    move-result-object v0

    iget-object v1, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    iget-object v2, p0, Ld/a/b/g/l/c/b;->a:Ld/a/b/g/l/a;

    invoke-virtual {v0, v1, v2}, Ld/a/b/g/l/d/d;->a(Ld/a/b/g/l/f/b;Ld/a/b/g/l/a;)V

    return-void
.end method

.method public final a(Ld/a/b/g/l/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/c/b;->a:Ld/a/b/g/l/a;

    .line 2
    invoke-virtual {p1}, Ld/a/b/g/l/a;->b()Ld/a/b/g/l/c/a;

    move-result-object p1

    iput-object p1, p0, Ld/a/b/g/l/c/b;->c:Ld/a/b/g/l/c/a;

    return-void
.end method

.method public a(Ld/a/b/g/l/f/b;)V
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    return-void
.end method

.method public final b()V
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/b;->c:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_7

    .line 2
    invoke-interface {v0}, Ld/a/b/g/l/c/a;->c()V

    :cond_7
    return-void
.end method

.method public final c()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/c/b;->c:Ld/a/b/g/l/c/a;

    if-eqz v0, :cond_9

    .line 2
    iget-object v1, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-interface {v0, v1}, Ld/a/b/g/l/c/a;->b(Ld/a/b/g/l/f/b;)V

    .line 3
    :cond_9
    iget-object v0, p0, Ld/a/b/g/l/c/b;->b:Ld/a/b/g/l/f/b;

    invoke-virtual {v0}, Ld/a/b/g/l/f/b;->e()I

    move-result v0

    invoke-static {v0}, Ld/a/b/g/l/g/d;->a(I)V

    return-void
.end method
