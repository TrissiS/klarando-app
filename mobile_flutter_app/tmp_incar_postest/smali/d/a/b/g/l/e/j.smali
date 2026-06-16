.class public Ld/a/b/g/l/e/j;
.super Ld/a/b/g/l/c/n;
.source "ForcedUpdateStrategy.java"


# instance fields
.field public a:Ld/a/b/g/l/c/n;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/c/n;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ld/a/b/g/l/c/n;-><init>()V

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/e/j;->a:Ld/a/b/g/l/c/n;

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public a(Ld/a/b/g/l/f/b;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/j;->a:Ld/a/b/g/l/c/n;

    invoke-virtual {v0, p1}, Ld/a/b/g/l/c/n;->a(Ld/a/b/g/l/f/b;)Z

    move-result p1

    return p1
.end method

.method public b()Z
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/e/j;->a:Ld/a/b/g/l/c/n;

    invoke-virtual {v0}, Ld/a/b/g/l/c/n;->b()Z

    move-result v0

    return v0
.end method
