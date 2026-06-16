.class public Lb/f/b/k/n/f;
.super Ljava/lang/Object;
.source "DependencyNode.java"

# interfaces
.implements Lb/f/b/k/n/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/f/b/k/n/f$a;
    }
.end annotation


# instance fields
.field public a:Lb/f/b/k/n/d;

.field public b:Z

.field public c:Z

.field public d:Lb/f/b/k/n/m;

.field public e:Lb/f/b/k/n/f$a;

.field public f:I

.field public g:I

.field public h:I

.field public i:Lb/f/b/k/n/g;

.field public j:Z

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lb/f/b/k/n/d;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lb/f/b/k/n/f;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/f/b/k/n/m;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Lb/f/b/k/n/f;->b:Z

    .line 4
    iput-boolean v1, p0, Lb/f/b/k/n/f;->c:Z

    .line 5
    sget-object v2, Lb/f/b/k/n/f$a;->UNKNOWN:Lb/f/b/k/n/f$a;

    iput-object v2, p0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    const/4 v2, 0x1

    .line 6
    iput v2, p0, Lb/f/b/k/n/f;->h:I

    .line 7
    iput-object v0, p0, Lb/f/b/k/n/f;->i:Lb/f/b/k/n/g;

    .line 8
    iput-boolean v1, p0, Lb/f/b/k/n/f;->j:Z

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    .line 10
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    .line 11
    iput-object p1, p0, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 22
    iget-object v0, p0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 23
    iget-object v0, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    .line 25
    iput v0, p0, Lb/f/b/k/n/f;->g:I

    .line 26
    iput-boolean v0, p0, Lb/f/b/k/n/f;->c:Z

    .line 27
    iput-boolean v0, p0, Lb/f/b/k/n/f;->b:Z

    return-void
.end method

.method public a(I)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    .line 3
    iput p1, p0, Lb/f/b/k/n/f;->g:I

    .line 4
    iget-object p1, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 5
    invoke-interface {v0, v0}, Lb/f/b/k/n/d;->a(Lb/f/b/k/n/d;)V

    goto :goto_10

    :cond_20
    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 7

    .line 6
    iget-object p1, p0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 7
    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_6

    return-void

    :cond_17
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lb/f/b/k/n/f;->c:Z

    .line 9
    iget-object v0, p0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    if-eqz v0, :cond_21

    .line 10
    invoke-interface {v0, p0}, Lb/f/b/k/n/d;->a(Lb/f/b/k/n/d;)V

    .line 11
    :cond_21
    iget-boolean v0, p0, Lb/f/b/k/n/f;->b:Z

    if-eqz v0, :cond_2b

    .line 12
    iget-object p1, p0, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    invoke-virtual {p1, p0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/d;)V

    return-void

    :cond_2b
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 13
    iget-object v2, p0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_33
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_48

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/f/b/k/n/f;

    .line 14
    instance-of v4, v3, Lb/f/b/k/n/g;

    if-eqz v4, :cond_44

    goto :goto_33

    :cond_44
    add-int/lit8 v1, v1, 0x1

    move-object v0, v3

    goto :goto_33

    :cond_48
    if-eqz v0, :cond_6a

    if-ne v1, p1, :cond_6a

    .line 15
    iget-boolean p1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz p1, :cond_6a

    .line 16
    iget-object p1, p0, Lb/f/b/k/n/f;->i:Lb/f/b/k/n/g;

    if-eqz p1, :cond_62

    .line 17
    iget-boolean v1, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_61

    .line 18
    iget v1, p0, Lb/f/b/k/n/f;->h:I

    iget p1, p1, Lb/f/b/k/n/f;->g:I

    mul-int v1, v1, p1

    iput v1, p0, Lb/f/b/k/n/f;->f:I

    goto :goto_62

    :cond_61
    return-void

    .line 19
    :cond_62
    :goto_62
    iget p1, v0, Lb/f/b/k/n/f;->g:I

    iget v0, p0, Lb/f/b/k/n/f;->f:I

    add-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 20
    :cond_6a
    iget-object p1, p0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    if-eqz p1, :cond_71

    .line 21
    invoke-interface {p1, p0}, Lb/f/b/k/n/d;->a(Lb/f/b/k/n/d;)V

    :cond_71
    return-void
.end method

.method public b(Lb/f/b/k/n/d;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    iget-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_c

    .line 3
    invoke-interface {p1, p1}, Lb/f/b/k/n/d;->a(Lb/f/b/k/n/d;)V

    :cond_c
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lb/f/b/k/n/f;->d:Lb/f/b/k/n/m;

    iget-object v1, v1, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_2a

    iget v1, p0, Lb/f/b/k/n/f;->g:I

    .line 2
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_2c

    :cond_2a
    const-string v1, "unresolved"

    :goto_2c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ") <t="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":d="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
