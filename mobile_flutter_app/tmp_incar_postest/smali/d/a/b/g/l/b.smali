.class public final Ld/a/b/g/l/b;
.super Ljava/lang/Object;
.source "UpdateConfig.java"


# static fields
.field public static p:Ld/a/b/g/l/b;


# instance fields
.field public a:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/c;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Ld/a/b/g/l/c/f;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ld/a/b/g/l/f/a;

.field public d:Ld/a/b/g/l/c/n;

.field public e:Ld/a/b/g/l/c/b;

.field public f:Ld/a/b/g/l/c/i;

.field public g:Ld/a/b/g/l/c/e;

.field public h:Ld/a/b/g/l/c/m;

.field public i:Ld/a/b/g/l/c/h;

.field public j:Ld/a/b/g/l/c/l;

.field public k:Ld/a/b/g/l/c/g;

.field public l:Ld/a/b/g/l/c/j;

.field public m:Ljava/util/concurrent/ExecutorService;

.field public n:Ld/a/b/g/l/c/a;

.field public o:Ld/a/b/g/l/c/d;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static p()Ld/a/b/g/l/b;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/g/l/b;->p:Ld/a/b/g/l/b;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/b;

    invoke-direct {v0}, Ld/a/b/g/l/b;-><init>()V

    sput-object v0, Ld/a/b/g/l/b;->p:Ld/a/b/g/l/b;

    .line 3
    :cond_b
    sget-object v0, Ld/a/b/g/l/b;->p:Ld/a/b/g/l/b;

    return-object v0
.end method


# virtual methods
.method public a(Ld/a/b/g/l/c/i;)Ld/a/b/g/l/b;
    .registers 2

    .line 3
    iput-object p1, p0, Ld/a/b/g/l/b;->f:Ld/a/b/g/l/c/i;

    return-object p0
.end method

.method public a(Ld/a/b/g/l/c/j;)Ld/a/b/g/l/b;
    .registers 2

    .line 4
    iput-object p1, p0, Ld/a/b/g/l/b;->l:Ld/a/b/g/l/c/j;

    return-object p0
.end method

.method public a(Ld/a/b/g/l/c/m;)Ld/a/b/g/l/b;
    .registers 2

    .line 2
    iput-object p1, p0, Ld/a/b/g/l/b;->h:Ld/a/b/g/l/c/m;

    return-object p0
.end method

.method public a(Ld/a/b/g/l/f/a;)Ld/a/b/g/l/b;
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/b;->c:Ld/a/b/g/l/f/a;

    return-object p0
.end method

.method public a()Ld/a/b/g/l/c/a;
    .registers 2

    .line 5
    iget-object v0, p0, Ld/a/b/g/l/b;->n:Ld/a/b/g/l/c/a;

    return-object v0
.end method

.method public b()Ld/a/b/g/l/f/a;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->c:Ld/a/b/g/l/f/a;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Ld/a/b/g/l/f/a;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 2
    iget-object v0, p0, Ld/a/b/g/l/b;->c:Ld/a/b/g/l/f/a;

    return-object v0

    .line 3
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Do not set url in CheckEntity"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c()Ld/a/b/g/l/c/b;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->e:Ld/a/b/g/l/c/b;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/i;

    invoke-direct {v0}, Ld/a/b/g/l/e/i;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->e:Ld/a/b/g/l/c/b;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->e:Ld/a/b/g/l/c/b;

    return-object v0
.end method

.method public d()Ljava/lang/Class;
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
    iget-object v0, p0, Ld/a/b/g/l/b;->a:Ljava/lang/Class;

    if-nez v0, :cond_8

    .line 2
    const-class v0, Ld/a/b/g/l/e/a;

    iput-object v0, p0, Ld/a/b/g/l/b;->a:Ljava/lang/Class;

    .line 3
    :cond_8
    iget-object v0, p0, Ld/a/b/g/l/b;->a:Ljava/lang/Class;

    return-object v0
.end method

.method public e()Ld/a/b/g/l/c/d;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->o:Ld/a/b/g/l/c/d;

    return-object v0
.end method

.method public f()Ld/a/b/g/l/c/e;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->g:Ld/a/b/g/l/c/e;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/b;

    invoke-direct {v0}, Ld/a/b/g/l/e/b;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->g:Ld/a/b/g/l/c/e;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->g:Ld/a/b/g/l/c/e;

    return-object v0
.end method

.method public g()Ljava/lang/Class;
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
    iget-object v0, p0, Ld/a/b/g/l/b;->b:Ljava/lang/Class;

    if-nez v0, :cond_8

    .line 2
    const-class v0, Ld/a/b/g/l/e/c;

    iput-object v0, p0, Ld/a/b/g/l/b;->b:Ljava/lang/Class;

    .line 3
    :cond_8
    iget-object v0, p0, Ld/a/b/g/l/b;->b:Ljava/lang/Class;

    return-object v0
.end method

.method public h()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->m:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_b

    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Ld/a/b/g/l/b;->m:Ljava/util/concurrent/ExecutorService;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->m:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public i()Ld/a/b/g/l/c/g;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->k:Ld/a/b/g/l/c/g;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/d;

    invoke-direct {v0}, Ld/a/b/g/l/e/d;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->k:Ld/a/b/g/l/c/g;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->k:Ld/a/b/g/l/c/g;

    return-object v0
.end method

.method public j()Ld/a/b/g/l/c/h;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->i:Ld/a/b/g/l/c/h;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/e;

    invoke-direct {v0}, Ld/a/b/g/l/e/e;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->i:Ld/a/b/g/l/c/h;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->i:Ld/a/b/g/l/c/h;

    return-object v0
.end method

.method public k()Ld/a/b/g/l/c/i;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->f:Ld/a/b/g/l/c/i;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/f;

    invoke-direct {v0}, Ld/a/b/g/l/e/f;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->f:Ld/a/b/g/l/c/i;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->f:Ld/a/b/g/l/c/i;

    return-object v0
.end method

.method public l()Ld/a/b/g/l/c/j;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->l:Ld/a/b/g/l/c/j;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/g;

    invoke-direct {v0}, Ld/a/b/g/l/e/g;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->l:Ld/a/b/g/l/c/j;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->l:Ld/a/b/g/l/c/j;

    return-object v0
.end method

.method public m()Ld/a/b/g/l/c/l;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->j:Ld/a/b/g/l/c/l;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/h;

    invoke-direct {v0}, Ld/a/b/g/l/e/h;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->j:Ld/a/b/g/l/c/l;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->j:Ld/a/b/g/l/c/l;

    return-object v0
.end method

.method public n()Ld/a/b/g/l/c/m;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->h:Ld/a/b/g/l/c/m;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "update parser is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public o()Ld/a/b/g/l/c/n;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/g/l/b;->d:Ld/a/b/g/l/c/n;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/g/l/e/l;

    invoke-direct {v0}, Ld/a/b/g/l/e/l;-><init>()V

    iput-object v0, p0, Ld/a/b/g/l/b;->d:Ld/a/b/g/l/c/n;

    .line 3
    :cond_b
    iget-object v0, p0, Ld/a/b/g/l/b;->d:Ld/a/b/g/l/c/n;

    return-object v0
.end method
