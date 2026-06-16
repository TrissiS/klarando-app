.class public Lb/f/b/k/n/l;
.super Lb/f/b/k/n/m;
.source "VerticalWidgetRun.java"


# instance fields
.field public k:Lb/f/b/k/n/f;

.field public l:Lb/f/b/k/n/g;


# direct methods
.method public constructor <init>(Lb/f/b/k/e;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/m;-><init>(Lb/f/b/k/e;)V

    .line 2
    new-instance p1, Lb/f/b/k/n/f;

    invoke-direct {p1, p0}, Lb/f/b/k/n/f;-><init>(Lb/f/b/k/n/m;)V

    iput-object p1, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    .line 4
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v1, Lb/f/b/k/n/f$a;->TOP:Lb/f/b/k/n/f$a;

    iput-object v1, v0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 5
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    sget-object v1, Lb/f/b/k/n/f$a;->BOTTOM:Lb/f/b/k/n/f$a;

    iput-object v1, v0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 6
    sget-object v0, Lb/f/b/k/n/f$a;->BASELINE:Lb/f/b/k/n/f$a;

    iput-object v0, p1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    const/4 p1, 0x1

    .line 7
    iput p1, p0, Lb/f/b/k/n/m;->f:I

    return-void
.end method


# virtual methods
.method public a()V
    .registers 10

    .line 51
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-boolean v1, v0, Lb/f/b/k/e;->a:Z

    if-eqz v1, :cond_f

    .line 52
    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0}, Lb/f/b/k/e;->k()I

    move-result v0

    invoke-virtual {v1, v0}, Lb/f/b/k/n/g;->a(I)V

    .line 53
    :cond_f
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_97

    .line 54
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v0

    iput-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    .line 55
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 56
    new-instance v0, Lb/f/b/k/n/a;

    invoke-direct {v0, p0}, Lb/f/b/k/n/a;-><init>(Lb/f/b/k/n/m;)V

    iput-object v0, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    .line 57
    :cond_2c
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v0, v1, :cond_d1

    .line 58
    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_85

    .line 59
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_85

    .line 60
    invoke-virtual {v0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_85

    .line 61
    invoke-virtual {v0}, Lb/f/b/k/e;->k()I

    move-result v1

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    sub-int/2addr v1, v2

    .line 62
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v3, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v4, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v4, v4, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v4}, Lb/f/b/k/d;->a()I

    move-result v4

    invoke-virtual {p0, v2, v3, v4}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 63
    iget-object v2, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {p0, v2, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 64
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    return-void

    .line 65
    :cond_85
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_d1

    .line 66
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->k()I

    move-result v1

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_d1

    .line 67
    :cond_97
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_d1

    .line 68
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_d1

    .line 69
    invoke-virtual {v0}, Lb/f/b/k/e;->x()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_d1

    .line 70
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v2, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 71
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    return-void

    .line 72
    :cond_d1
    :goto_d1
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    const/4 v1, 0x0

    const/4 v2, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x3

    if-eqz v0, :cond_269

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-boolean v6, v0, Lb/f/b/k/e;->a:Z

    if-eqz v6, :cond_269

    .line 73
    iget-object v6, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v7, v6, v4

    iget-object v7, v7, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v7, :cond_16a

    aget-object v6, v6, v5

    iget-object v6, v6, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v6, :cond_16a

    .line 74
    invoke-virtual {v0}, Lb/f/b/k/e;->G()Z

    move-result v0

    if-eqz v0, :cond_114

    .line 75
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    .line 76
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v5

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_153

    .line 77
    :cond_114
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v4

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_12f

    .line 78
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 79
    :cond_12f
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v5

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_14b

    .line 80
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v5

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 81
    :cond_14b
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 82
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 83
    :goto_153
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_498

    .line 84
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->e()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_498

    .line 85
    :cond_16a
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v6, v3, v4

    iget-object v6, v6, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v6, :cond_1ad

    .line 86
    aget-object v0, v3, v4

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_498

    .line 87
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 88
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 89
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_498

    .line 90
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->e()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_498

    .line 91
    :cond_1ad
    aget-object v4, v3, v5

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_1ee

    .line 92
    aget-object v0, v3, v5

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_1d7

    .line 93
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v5

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 94
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    neg-int v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 95
    :cond_1d7
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_498

    .line 96
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->e()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_498

    .line 97
    :cond_1ee
    aget-object v4, v3, v2

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_21c

    .line 98
    aget-object v0, v3, v2

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_498

    .line 99
    iget-object v2, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    invoke-virtual {p0, v2, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 100
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->e()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 101
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_498

    .line 102
    :cond_21c
    instance-of v1, v0, Lb/f/b/k/i;

    if-nez v1, :cond_498

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_498

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    sget-object v1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    .line 103
    invoke-virtual {v0, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v0, :cond_498

    .line 104
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 105
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->C()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 106
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 107
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_498

    .line 108
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->e()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_498

    .line 109
    :cond_269
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_2e0

    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v6, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v6, :cond_2e0

    .line 110
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v6, v0, Lb/f/b/k/e;->k:I

    if-eq v6, v4, :cond_2b2

    if-eq v6, v5, :cond_27e

    goto :goto_2e5

    .line 111
    :cond_27e
    invoke-virtual {v0}, Lb/f/b/k/e;->G()Z

    move-result v0

    if-nez v0, :cond_2e5

    .line 112
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v6, v0, Lb/f/b/k/e;->j:I

    if-ne v6, v5, :cond_28b

    goto :goto_2e5

    .line 113
    :cond_28b
    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    .line 114
    iget-object v6, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v6, v6, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 117
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e5

    .line 119
    :cond_2b2
    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-nez v0, :cond_2b9

    goto :goto_2e5

    .line 120
    :cond_2b9
    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    .line 121
    iget-object v6, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v6, v6, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->b:Z

    .line 124
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v6, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e5

    .line 126
    :cond_2e0
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, p0}, Lb/f/b/k/n/f;->b(Lb/f/b/k/n/d;)V

    .line 127
    :cond_2e5
    :goto_2e5
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v6, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v7, v6, v4

    iget-object v7, v7, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v7, :cond_34a

    aget-object v6, v6, v5

    iget-object v6, v6, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v6, :cond_34a

    .line 128
    invoke-virtual {v0}, Lb/f/b/k/e;->G()Z

    move-result v0

    if-eqz v0, :cond_319

    .line 129
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    .line 130
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v5

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto :goto_337

    .line 131
    :cond_319
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v4

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    .line 132
    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v5

    invoke-virtual {p0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v1

    .line 133
    invoke-virtual {v0, p0}, Lb/f/b/k/n/f;->b(Lb/f/b/k/n/d;)V

    .line 134
    invoke-virtual {v1, p0}, Lb/f/b/k/n/f;->b(Lb/f/b/k/n/d;)V

    .line 135
    sget-object v0, Lb/f/b/k/n/m$b;->CENTER:Lb/f/b/k/n/m$b;

    iput-object v0, p0, Lb/f/b/k/n/m;->j:Lb/f/b/k/n/m$b;

    .line 136
    :goto_337
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_48a

    .line 137
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    goto/16 :goto_48a

    .line 138
    :cond_34a
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v6, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v7, v6, v4

    iget-object v7, v7, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v8, 0x0

    if-eqz v7, :cond_3bc

    .line 139
    aget-object v0, v6, v4

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_48a

    .line 140
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v4

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 141
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 142
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_386

    .line 143
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 144
    :cond_386
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_48a

    .line 145
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    cmpl-float v0, v0, v8

    if-lez v0, :cond_48a

    .line 146
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_48a

    .line 147
    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-object p0, v0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    goto/16 :goto_48a

    .line 150
    :cond_3bc
    aget-object v4, v6, v5

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    const/4 v7, -0x1

    if-eqz v4, :cond_3f7

    .line 151
    aget-object v0, v6, v5

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_48a

    .line 152
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v2, v5

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 153
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v7, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 154
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_48a

    .line 155
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    goto/16 :goto_48a

    .line 156
    :cond_3f7
    aget-object v4, v6, v2

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_41d

    .line 157
    aget-object v0, v6, v2

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_48a

    .line 158
    iget-object v2, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    invoke-virtual {p0, v2, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 159
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v7, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 160
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    goto :goto_48a

    .line 161
    :cond_41d
    instance-of v1, v0, Lb/f/b/k/i;

    if-nez v1, :cond_48a

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_48a

    .line 162
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 163
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->C()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 164
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 165
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->D()Z

    move-result v0

    if-eqz v0, :cond_456

    .line 166
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/l;->l:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v3, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    .line 167
    :cond_456
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_48a

    .line 168
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    cmpl-float v0, v0, v8

    if-lez v0, :cond_48a

    .line 169
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v2, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_48a

    .line 170
    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v1, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-object p0, v0, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 173
    :cond_48a
    :goto_48a
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_498

    .line 174
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v3, v0, Lb/f/b/k/n/f;->c:Z

    :cond_498
    :goto_498
    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 8

    .line 1
    sget-object v0, Lb/f/b/k/n/l$a;->a:[I

    iget-object v1, p0, Lb/f/b/k/n/m;->j:Lb/f/b/k/n/m$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_22

    if-eq v0, v2, :cond_1e

    if-eq v0, v1, :cond_14

    goto :goto_25

    .line 2
    :cond_14
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v0, v0, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    invoke-virtual {p0, p1, v1, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    return-void

    .line 3
    :cond_1e
    invoke-virtual {p0, p1}, Lb/f/b/k/n/m;->b(Lb/f/b/k/n/d;)V

    goto :goto_25

    .line 4
    :cond_22
    invoke-virtual {p0, p1}, Lb/f/b/k/n/m;->c(Lb/f/b/k/n/d;)V

    .line 5
    :goto_25
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, p1, Lb/f/b/k/n/f;->c:Z

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x0

    if-eqz v0, :cond_a8

    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-nez p1, :cond_a8

    .line 6
    iget-object p1, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v0, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne p1, v0, :cond_a8

    .line 7
    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, p1, Lb/f/b/k/e;->k:I

    if-eq v0, v2, :cond_8a

    if-eq v0, v1, :cond_41

    goto :goto_a8

    .line 8
    :cond_41
    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_a8

    .line 9
    invoke-virtual {p1}, Lb/f/b/k/e;->j()I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_74

    if-eqz p1, :cond_64

    if-eq p1, v3, :cond_56

    const/4 p1, 0x0

    goto :goto_84

    .line 10
    :cond_56
    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    int-to-float v0, v0

    invoke-virtual {p1}, Lb/f/b/k/e;->i()F

    move-result p1

    goto :goto_81

    .line 11
    :cond_64
    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    int-to-float v0, v0

    invoke-virtual {p1}, Lb/f/b/k/e;->i()F

    move-result p1

    mul-float v0, v0, p1

    goto :goto_82

    .line 12
    :cond_74
    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, p1, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    int-to-float v0, v0

    invoke-virtual {p1}, Lb/f/b/k/e;->i()F

    move-result p1

    :goto_81
    div-float/2addr v0, p1

    :goto_82
    add-float/2addr v0, v4

    float-to-int p1, v0

    .line 13
    :goto_84
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_a8

    .line 14
    :cond_8a
    invoke-virtual {p1}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p1

    if-eqz p1, :cond_a8

    .line 15
    iget-object p1, p1, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object p1, p1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_a8

    .line 16
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, v0, Lb/f/b/k/e;->r:F

    .line 17
    iget p1, p1, Lb/f/b/k/n/f;->g:I

    int-to-float p1, p1

    mul-float p1, p1, v0

    add-float/2addr p1, v4

    float-to-int p1, p1

    .line 18
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, p1}, Lb/f/b/k/n/g;->a(I)V

    .line 19
    :cond_a8
    :goto_a8
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v0, p1, Lb/f/b/k/n/f;->c:Z

    if-eqz v0, :cond_1ce

    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->c:Z

    if-nez v1, :cond_b6

    goto/16 :goto_1ce

    .line 20
    :cond_b6
    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz p1, :cond_c5

    iget-boolean p1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz p1, :cond_c5

    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-eqz p1, :cond_c5

    return-void

    .line 21
    :cond_c5
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-nez p1, :cond_10f

    iget-object p1, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v0, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne p1, v0, :cond_10f

    iget-object p1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, p1, Lb/f/b/k/e;->j:I

    if-nez v0, :cond_10f

    .line 22
    invoke-virtual {p1}, Lb/f/b/k/e;->G()Z

    move-result p1

    if-nez p1, :cond_10f

    .line 23
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/b/k/n/f;

    .line 24
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 25
    iget p1, p1, Lb/f/b/k/n/f;->g:I

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v2, v1, Lb/f/b/k/n/f;->f:I

    add-int/2addr p1, v2

    .line 26
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v2, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v0, v2

    sub-int v2, v0, p1

    .line 27
    invoke-virtual {v1, p1}, Lb/f/b/k/n/f;->a(I)V

    .line 28
    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {p1, v0}, Lb/f/b/k/n/f;->a(I)V

    .line 29
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p1, v2}, Lb/f/b/k/n/g;->a(I)V

    return-void

    .line 30
    :cond_10f
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-nez p1, :cond_163

    iget-object p1, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v0, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne p1, v0, :cond_163

    iget p1, p0, Lb/f/b/k/n/m;->a:I

    if-ne p1, v3, :cond_163

    .line 31
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_163

    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_163

    .line 32
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/b/k/n/f;

    .line 33
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 34
    iget p1, p1, Lb/f/b/k/n/f;->g:I

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    add-int/2addr p1, v1

    .line 35
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    add-int/2addr v0, v1

    sub-int/2addr v0, p1

    .line 36
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v1, p1, Lb/f/b/k/n/g;->m:I

    if-ge v0, v1, :cond_160

    .line 37
    invoke-virtual {p1, v0}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_163

    .line 38
    :cond_160
    invoke-virtual {p1, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 39
    :cond_163
    :goto_163
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean p1, p1, Lb/f/b/k/n/f;->j:Z

    if-nez p1, :cond_16a

    return-void

    .line 40
    :cond_16a
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_1ce

    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_1ce

    .line 41
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object p1, p1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/f/b/k/n/f;

    .line 42
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 43
    iget v1, p1, Lb/f/b/k/n/f;->g:I

    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v1, v2

    .line 44
    iget v2, v0, Lb/f/b/k/n/f;->g:I

    iget-object v3, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v3, v3, Lb/f/b/k/n/f;->f:I

    add-int/2addr v2, v3

    .line 45
    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v3}, Lb/f/b/k/e;->v()F

    move-result v3

    if-ne p1, v0, :cond_1ae

    .line 46
    iget v1, p1, Lb/f/b/k/n/f;->g:I

    .line 47
    iget v2, v0, Lb/f/b/k/n/f;->g:I

    const/high16 v3, 0x3f000000    # 0.5f

    :cond_1ae
    sub-int/2addr v2, v1

    .line 48
    iget-object p1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget p1, p1, Lb/f/b/k/n/f;->g:I

    sub-int/2addr v2, p1

    .line 49
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    int-to-float v0, v1

    add-float/2addr v0, v4

    int-to-float v1, v2

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Lb/f/b/k/n/f;->a(I)V

    .line 50
    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Lb/f/b/k/n/f;->a(I)V

    :cond_1ce
    :goto_1ce
    return-void
.end method

.method public b()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_d

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    invoke-virtual {v1, v0}, Lb/f/b/k/e;->s(I)V

    :cond_d
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

    .line 3
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    .line 4
    iget-object v0, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    .line 5
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lb/f/b/k/n/m;->g:Z

    return-void
.end method

.method public f()Z
    .registers 4

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_10

    .line 2
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v0, v0, Lb/f/b/k/e;->k:I

    if-nez v0, :cond_e

    return v2

    :cond_e
    const/4 v0, 0x0

    return v0

    :cond_10
    return v2
.end method

.method public g()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lb/f/b/k/n/m;->g:Z

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-virtual {v1}, Lb/f/b/k/n/f;->a()V

    .line 3
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    .line 4
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v1}, Lb/f/b/k/n/f;->a()V

    .line 5
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    .line 6
    iget-object v1, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    invoke-virtual {v1}, Lb/f/b/k/n/f;->a()V

    .line 7
    iget-object v1, p0, Lb/f/b/k/n/l;->k:Lb/f/b/k/n/f;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    .line 8
    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VerticalRun "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
