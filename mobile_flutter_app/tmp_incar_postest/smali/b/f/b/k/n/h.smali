.class public Lb/f/b/k/n/h;
.super Lb/f/b/k/n/m;
.source "GuidelineReference.java"


# direct methods
.method public constructor <init>(Lb/f/b/k/e;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/m;-><init>(Lb/f/b/k/e;)V

    .line 2
    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    invoke-virtual {v0}, Lb/f/b/k/n/j;->c()V

    .line 3
    iget-object v0, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    invoke-virtual {v0}, Lb/f/b/k/n/l;->c()V

    .line 4
    check-cast p1, Lb/f/b/k/h;

    invoke-virtual {p1}, Lb/f/b/k/h;->J()I

    move-result p1

    iput p1, p0, Lb/f/b/k/n/m;->f:I

    return-void
.end method


# virtual methods
.method public a()V
    .registers 6

    .line 9
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    check-cast v0, Lb/f/b/k/h;

    .line 10
    invoke-virtual {v0}, Lb/f/b/k/h;->K()I

    move-result v1

    .line 11
    invoke-virtual {v0}, Lb/f/b/k/h;->L()I

    move-result v2

    .line 12
    invoke-virtual {v0}, Lb/f/b/k/h;->M()F

    .line 13
    invoke-virtual {v0}, Lb/f/b/k/h;->J()I

    move-result v0

    const/4 v3, 0x1

    const/4 v4, -0x1

    if-ne v0, v3, :cond_96

    if-eq v1, v4, :cond_3c

    .line 14
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_82

    :cond_3c
    if-eq v2, v4, :cond_62

    .line 17
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    neg-int v1, v2

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_82

    .line 20
    :cond_62
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 21
    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    :goto_82
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/h;->a(Lb/f/b/k/n/f;)V

    .line 24
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/h;->a(Lb/f/b/k/n/f;)V

    goto/16 :goto_113

    :cond_96
    if-eq v1, v4, :cond_bb

    .line 25
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_101

    :cond_bb
    if-eq v2, v4, :cond_e1

    .line 28
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    neg-int v1, v2

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_101

    .line 31
    :cond_e1
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 32
    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->M:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    :goto_101
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/h;->a(Lb/f/b/k/n/f;)V

    .line 35
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/h;->a(Lb/f/b/k/n/f;)V

    :goto_113
    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 4

    .line 3
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v0, p1, Lb/f/b/k/n/f;->c:Z

    if-nez v0, :cond_7

    return-void

    .line 4
    :cond_7
    iget-boolean v0, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_c

    return-void

    .line 5
    :cond_c
    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/b/k/n/f;

    .line 6
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    check-cast v0, Lb/f/b/k/h;

    const/high16 v1, 0x3f000000    # 0.5f

    .line 7
    iget p1, p1, Lb/f/b/k/n/f;->g:I

    int-to-float p1, p1

    invoke-virtual {v0}, Lb/f/b/k/h;->M()F

    move-result v0

    mul-float p1, p1, v0

    add-float/2addr p1, v1

    float-to-int p1, p1

    .line 8
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/f;->a(I)V

    return-void
.end method

.method public final a(Lb/f/b/k/n/f;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    check-cast v0, Lb/f/b/k/h;

    .line 2
    invoke-virtual {v0}, Lb/f/b/k/h;->J()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    .line 3
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->r(I)V

    goto :goto_1e

    .line 4
    :cond_15
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->s(I)V

    :goto_1e
    return-void
.end method

.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    return-void
.end method

.method public f()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
