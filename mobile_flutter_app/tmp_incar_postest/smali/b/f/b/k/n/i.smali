.class public Lb/f/b/k/n/i;
.super Lb/f/b/k/n/m;
.source "HelperReferences.java"


# direct methods
.method public constructor <init>(Lb/f/b/k/e;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/m;-><init>(Lb/f/b/k/e;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 8

    .line 3
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    instance-of v1, v0, Lb/f/b/k/a;

    if-eqz v1, :cond_121

    .line 4
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lb/f/b/k/n/f;->b:Z

    .line 5
    check-cast v0, Lb/f/b/k/a;

    .line 6
    invoke-virtual {v0}, Lb/f/b/k/a;->K()I

    move-result v1

    .line 7
    invoke-virtual {v0}, Lb/f/b/k/a;->J()Z

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eqz v1, :cond_e3

    if-eq v1, v2, :cond_a4

    const/4 v2, 0x2

    if-eq v1, v2, :cond_64

    const/4 v2, 0x3

    if-eq v1, v2, :cond_24

    goto/16 :goto_121

    .line 8
    :cond_24
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v2, Lb/f/b/k/n/f$a;->BOTTOM:Lb/f/b/k/n/f$a;

    iput-object v2, v1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 9
    :goto_2a
    iget v1, v0, Lb/f/b/k/j;->E0:I

    if-ge v5, v1, :cond_50

    .line 10
    iget-object v1, v0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v1, v1, v5

    if-nez v3, :cond_3b

    .line 11
    invoke-virtual {v1}, Lb/f/b/k/e;->z()I

    move-result v2

    if-ne v2, v4, :cond_3b

    goto :goto_4d

    .line 12
    :cond_3b
    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    .line 13
    iget-object v2, v1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v2, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_4d
    add-int/lit8 v5, v5, 0x1

    goto :goto_2a

    .line 15
    :cond_50
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    .line 16
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    goto/16 :goto_121

    .line 17
    :cond_64
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v2, Lb/f/b/k/n/f$a;->TOP:Lb/f/b/k/n/f$a;

    iput-object v2, v1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 18
    :goto_6a
    iget v1, v0, Lb/f/b/k/j;->E0:I

    if-ge v5, v1, :cond_90

    .line 19
    iget-object v1, v0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v1, v1, v5

    if-nez v3, :cond_7b

    .line 20
    invoke-virtual {v1}, Lb/f/b/k/e;->z()I

    move-result v2

    if-ne v2, v4, :cond_7b

    goto :goto_8d

    .line 21
    :cond_7b
    iget-object v1, v1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 22
    iget-object v2, v1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v2, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_8d
    add-int/lit8 v5, v5, 0x1

    goto :goto_6a

    .line 24
    :cond_90
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    .line 25
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    goto/16 :goto_121

    .line 26
    :cond_a4
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v2, Lb/f/b/k/n/f$a;->RIGHT:Lb/f/b/k/n/f$a;

    iput-object v2, v1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 27
    :goto_aa
    iget v1, v0, Lb/f/b/k/j;->E0:I

    if-ge v5, v1, :cond_d0

    .line 28
    iget-object v1, v0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v1, v1, v5

    if-nez v3, :cond_bb

    .line 29
    invoke-virtual {v1}, Lb/f/b/k/e;->z()I

    move-result v2

    if-ne v2, v4, :cond_bb

    goto :goto_cd

    .line 30
    :cond_bb
    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    .line 31
    iget-object v2, v1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v2, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_cd
    add-int/lit8 v5, v5, 0x1

    goto :goto_aa

    .line 33
    :cond_d0
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    .line 34
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    goto :goto_121

    .line 35
    :cond_e3
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v2, Lb/f/b/k/n/f$a;->LEFT:Lb/f/b/k/n/f$a;

    iput-object v2, v1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 36
    :goto_e9
    iget v1, v0, Lb/f/b/k/j;->E0:I

    if-ge v5, v1, :cond_10f

    .line 37
    iget-object v1, v0, Lb/f/b/k/j;->D0:[Lb/f/b/k/e;

    aget-object v1, v1, v5

    if-nez v3, :cond_fa

    .line 38
    invoke-virtual {v1}, Lb/f/b/k/e;->z()I

    move-result v2

    if-ne v2, v4, :cond_fa

    goto :goto_10c

    .line 39
    :cond_fa
    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 40
    iget-object v2, v1, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v2, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_10c
    add-int/lit8 v5, v5, 0x1

    goto :goto_e9

    .line 42
    :cond_10f
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    .line 43
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p0, v0}, Lb/f/b/k/n/i;->a(Lb/f/b/k/n/f;)V

    :cond_121
    :goto_121
    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 8

    .line 44
    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    check-cast p1, Lb/f/b/k/a;

    .line 45
    invoke-virtual {p1}, Lb/f/b/k/a;->K()I

    move-result v0

    .line 46
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    :cond_13
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/f/b/k/n/f;

    .line 47
    iget v5, v5, Lb/f/b/k/n/f;->g:I

    if-eq v4, v2, :cond_25

    if-ge v5, v4, :cond_26

    :cond_25
    move v4, v5

    :cond_26
    if-ge v3, v5, :cond_13

    move v3, v5

    goto :goto_13

    :cond_2a
    if-eqz v0, :cond_3b

    const/4 v1, 0x2

    if-ne v0, v1, :cond_30

    goto :goto_3b

    .line 48
    :cond_30
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p1}, Lb/f/b/k/a;->L()I

    move-result p1

    add-int/2addr v3, p1

    invoke-virtual {v0, v3}, Lb/f/b/k/n/f;->a(I)V

    goto :goto_45

    .line 49
    :cond_3b
    :goto_3b
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {p1}, Lb/f/b/k/a;->L()I

    move-result p1

    add-int/2addr v4, p1

    invoke-virtual {v0, v4}, Lb/f/b/k/n/f;->a(I)V

    :goto_45
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

    instance-of v1, v0, Lb/f/b/k/a;

    if-eqz v1, :cond_25

    .line 2
    check-cast v0, Lb/f/b/k/a;

    .line 3
    invoke-virtual {v0}, Lb/f/b/k/a;->K()I

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    goto :goto_1c

    .line 4
    :cond_12
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->s(I)V

    goto :goto_25

    .line 5
    :cond_1c
    :goto_1c
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v0, v1}, Lb/f/b/k/e;->r(I)V

    :cond_25
    :goto_25
    return-void
.end method

.method public c()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lb/f/b/k/n/m;->c:Lb/f/b/k/n/k;

    .line 2
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    return-void
.end method

.method public f()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
