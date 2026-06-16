.class public Ld/a/b/g/l/a;
.super Ljava/lang/Object;
.source "UpdateBuilder.java"


# instance fields
.field public a:Z

.field public b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/c;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/f;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ld/a/b/g/l/f/a;

.field public e:Ld/a/b/g/l/c/n;

.field public f:Ld/a/b/g/l/c/b;

.field public g:Ld/a/b/g/l/c/i;

.field public h:Ld/a/b/g/l/c/e;

.field public i:Ld/a/b/g/l/c/m;

.field public j:Ld/a/b/g/l/c/h;

.field public k:Ld/a/b/g/l/c/l;

.field public l:Ld/a/b/g/l/c/g;

.field public m:Ld/a/b/g/l/c/j;

.field public n:Ld/a/b/g/l/b;

.field public o:Ld/a/b/g/l/d/a;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/b;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    .line 3
    new-instance v0, Ld/a/b/g/l/d/a;

    invoke-direct {v0}, Ld/a/b/g/l/d/a;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/a;->o:Ld/a/b/g/l/d/a;

    .line 4
    invoke-virtual {p1}, Ld/a/b/g/l/b;->a()Ld/a/b/g/l/c/a;

    move-result-object v1

    invoke-virtual {v0, v1}, Ld/a/b/g/l/d/a;->a(Ld/a/b/g/l/c/a;)V

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/a;->o:Ld/a/b/g/l/d/a;

    invoke-virtual {p1}, Ld/a/b/g/l/b;->e()Ld/a/b/g/l/c/d;

    move-result-object p1

    invoke-virtual {v0, p1}, Ld/a/b/g/l/d/a;->a(Ld/a/b/g/l/c/d;)V

    return-void
.end method

.method public static a(Ld/a/b/g/l/b;)Ld/a/b/g/l/a;
    .registers 2

    .line 1
    new-instance v0, Ld/a/b/g/l/a;

    invoke-direct {v0, p0}, Ld/a/b/g/l/a;-><init>(Ld/a/b/g/l/b;)V

    return-object v0
.end method

.method public static r()Ld/a/b/g/l/a;
    .registers 1

    .line 1
    invoke-static {}, Ld/a/b/g/l/b;->p()Ld/a/b/g/l/b;

    move-result-object v0

    invoke-static {v0}, Ld/a/b/g/l/a;->a(Ld/a/b/g/l/b;)Ld/a/b/g/l/a;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a(Ld/a/b/g/l/c/n;)Ld/a/b/g/l/a;
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/a;->e:Ld/a/b/g/l/c/n;

    return-object p0
.end method

.method public a()V
    .registers 2

    .line 2
    invoke-static {}, Ld/a/b/g/l/d/d;->a()Ld/a/b/g/l/d/d;

    move-result-object v0

    invoke-virtual {v0, p0}, Ld/a/b/g/l/d/d;->a(Ld/a/b/g/l/a;)V

    return-void
.end method

.method public b()Ld/a/b/g/l/c/a;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->o:Ld/a/b/g/l/d/a;

    return-object v0
.end method

.method public c()Ld/a/b/g/l/f/a;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->d:Ld/a/b/g/l/f/a;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->b()Ld/a/b/g/l/f/a;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->d:Ld/a/b/g/l/f/a;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->d:Ld/a/b/g/l/f/a;

    return-object v0
.end method

.method public d()Ld/a/b/g/l/c/b;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->f:Ld/a/b/g/l/c/b;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->c()Ld/a/b/g/l/c/b;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->f:Ld/a/b/g/l/c/b;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->f:Ld/a/b/g/l/c/b;

    return-object v0
.end method

.method public e()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->b:Ljava/lang/Class;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->d()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->b:Ljava/lang/Class;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->b:Ljava/lang/Class;

    return-object v0
.end method

.method public final f()Ld/a/b/g/l/b;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    return-object v0
.end method

.method public g()Ld/a/b/g/l/c/d;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->o:Ld/a/b/g/l/d/a;

    return-object v0
.end method

.method public h()Ld/a/b/g/l/c/e;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->h:Ld/a/b/g/l/c/e;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->f()Ld/a/b/g/l/c/e;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->h:Ld/a/b/g/l/c/e;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->h:Ld/a/b/g/l/c/e;

    return-object v0
.end method

.method public i()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/f;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->c:Ljava/lang/Class;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->g()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->c:Ljava/lang/Class;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->c:Ljava/lang/Class;

    return-object v0
.end method

.method public j()Ld/a/b/g/l/c/g;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->l:Ld/a/b/g/l/c/g;

    if-eqz v0, :cond_5

    goto :goto_b

    :cond_5
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->i()Ld/a/b/g/l/c/g;

    move-result-object v0

    :goto_b
    return-object v0
.end method

.method public k()Ld/a/b/g/l/c/h;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->j:Ld/a/b/g/l/c/h;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->j()Ld/a/b/g/l/c/h;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->j:Ld/a/b/g/l/c/h;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->j:Ld/a/b/g/l/c/h;

    return-object v0
.end method

.method public l()Ld/a/b/g/l/c/i;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->g:Ld/a/b/g/l/c/i;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->k()Ld/a/b/g/l/c/i;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->g:Ld/a/b/g/l/c/i;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->g:Ld/a/b/g/l/c/i;

    return-object v0
.end method

.method public m()Ld/a/b/g/l/c/j;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->m:Ld/a/b/g/l/c/j;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->l()Ld/a/b/g/l/c/j;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->m:Ld/a/b/g/l/c/j;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->m:Ld/a/b/g/l/c/j;

    return-object v0
.end method

.method public n()Ld/a/b/g/l/c/l;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->k:Ld/a/b/g/l/c/l;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->m()Ld/a/b/g/l/c/l;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->k:Ld/a/b/g/l/c/l;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->k:Ld/a/b/g/l/c/l;

    return-object v0
.end method

.method public o()Ld/a/b/g/l/c/m;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->i:Ld/a/b/g/l/c/m;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->n()Ld/a/b/g/l/c/m;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->i:Ld/a/b/g/l/c/m;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->i:Ld/a/b/g/l/c/m;

    return-object v0
.end method

.method public p()Ld/a/b/g/l/c/n;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/a;->e:Ld/a/b/g/l/c/n;

    if-nez v0, :cond_c

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/a;->n:Ld/a/b/g/l/b;

    invoke-virtual {v0}, Ld/a/b/g/l/b;->o()Ld/a/b/g/l/c/n;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/a;->e:Ld/a/b/g/l/c/n;

    .line 3
    :cond_c
    iget-object v0, p0, Ld/a/b/g/l/a;->e:Ld/a/b/g/l/c/n;

    return-object v0
.end method

.method public q()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Ld/a/b/g/l/a;->a:Z

    return v0
.end method
