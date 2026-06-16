.class public Lb/f/b/k/n/j;
.super Lb/f/b/k/n/m;
.source "HorizontalWidgetRun.java"


# static fields
.field public static k:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    sput-object v0, Lb/f/b/k/n/j;->k:[I

    return-void
.end method

.method public constructor <init>(Lb/f/b/k/e;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/m;-><init>(Lb/f/b/k/e;)V

    .line 2
    iget-object p1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    sget-object v0, Lb/f/b/k/n/f$a;->LEFT:Lb/f/b/k/n/f$a;

    iput-object v0, p1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    .line 3
    iget-object p1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    sget-object v0, Lb/f/b/k/n/f$a;->RIGHT:Lb/f/b/k/n/f$a;

    iput-object v0, p1, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lb/f/b/k/n/m;->f:I

    return-void
.end method


# virtual methods
.method public a()V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-boolean v1, v0, Lb/f/b/k/e;->a:Z

    if-eqz v1, :cond_f

    .line 2
    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0}, Lb/f/b/k/e;->A()I

    move-result v0

    invoke-virtual {v1, v0}, Lb/f/b/k/n/g;->a(I)V

    .line 3
    :cond_f
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_8e

    .line 4
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v0

    iput-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    .line 5
    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-eq v0, v1, :cond_d0

    .line 6
    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_7c

    .line 7
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_35

    .line 8
    invoke-virtual {v0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v1, v2, :cond_3d

    .line 9
    :cond_35
    invoke-virtual {v0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_7c

    .line 10
    :cond_3d
    invoke-virtual {v0}, Lb/f/b/k/e;->A()I

    move-result v1

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    sub-int/2addr v1, v2

    .line 11
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v3, v3, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v4, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v4, v4, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v4}, Lb/f/b/k/d;->a()I

    move-result v4

    invoke-virtual {p0, v2, v3, v4}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 12
    iget-object v2, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {p0, v2, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 13
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    return-void

    .line 14
    :cond_7c
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_d0

    .line 15
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->A()I

    move-result v1

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_d0

    .line 16
    :cond_8e
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_d0

    .line 17
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_a4

    .line 18
    invoke-virtual {v0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->FIXED:Lb/f/b/k/e$b;

    if-eq v1, v2, :cond_ac

    .line 19
    :cond_a4
    invoke-virtual {v0}, Lb/f/b/k/e;->n()Lb/f/b/k/e$b;

    move-result-object v1

    sget-object v2, Lb/f/b/k/e$b;->MATCH_PARENT:Lb/f/b/k/e$b;

    if-ne v1, v2, :cond_d0

    .line 20
    :cond_ac
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v2, v2, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 21
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    return-void

    .line 22
    :cond_d0
    :goto_d0
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1e4

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-boolean v3, v0, Lb/f/b/k/e;->a:Z

    if-eqz v3, :cond_1e4

    .line 23
    iget-object v3, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v1

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_152

    aget-object v3, v3, v2

    iget-object v3, v3, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v3, :cond_152

    .line 24
    invoke-virtual {v0}, Lb/f/b/k/e;->E()Z

    move-result v0

    if-eqz v0, :cond_111

    .line 25
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v3, v1

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    .line 26
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto/16 :goto_3ee

    .line 27
    :cond_111
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_12c

    .line 28
    iget-object v3, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v4, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v4, v4, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v4, v1

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    invoke-virtual {p0, v3, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 29
    :cond_12c
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v2

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_148

    .line 30
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lb/f/b/k/d;->a()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {p0, v1, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 31
    :cond_148
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-boolean v2, v0, Lb/f/b/k/n/f;->b:Z

    .line 32
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-boolean v2, v0, Lb/f/b/k/n/f;->b:Z

    goto/16 :goto_3ee

    .line 33
    :cond_152
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v1

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_180

    .line 34
    aget-object v0, v3, v1

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_3ee

    .line 35
    iget-object v2, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v3, v1

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    invoke-virtual {p0, v2, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 36
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_3ee

    .line 37
    :cond_180
    aget-object v1, v3, v2

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_1ac

    .line 38
    aget-object v0, v3, v2

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_3ee

    .line 39
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v3, v2

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 40
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    neg-int v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_3ee

    .line 41
    :cond_1ac
    instance-of v1, v0, Lb/f/b/k/i;

    if-nez v1, :cond_3ee

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_3ee

    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    sget-object v1, Lb/f/b/k/d$b;->CENTER:Lb/f/b/k/d$b;

    .line 42
    invoke-virtual {v0, v1}, Lb/f/b/k/e;->a(Lb/f/b/k/d$b;)Lb/f/b/k/d;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-nez v0, :cond_3ee

    .line 43
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 44
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v2}, Lb/f/b/k/e;->B()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 45
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v2, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    goto/16 :goto_3ee

    .line 46
    :cond_1e4
    iget-object v0, p0, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v3, :cond_31d

    .line 47
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v3, v0, Lb/f/b/k/e;->j:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_2f0

    const/4 v4, 0x3

    if-eq v3, v4, :cond_1f6

    goto/16 :goto_31d

    .line 48
    :cond_1f6
    iget v3, v0, Lb/f/b/k/e;->k:I

    if-ne v3, v4, :cond_29d

    .line 49
    iget-object v3, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-object p0, v3, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 50
    iget-object v3, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-object p0, v3, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 51
    iget-object v3, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v4, v3, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iput-object p0, v4, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 52
    iget-object v3, v3, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iput-object p0, v3, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 53
    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-object p0, v3, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 54
    invoke-virtual {v0}, Lb/f/b/k/e;->G()Z

    move-result v0

    if-eqz v0, :cond_26a

    .line 55
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v3, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-object p0, v3, Lb/f/b/k/n/f;->a:Lb/f/b/k/n/d;

    .line 58
    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v3, v3, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v3, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_31d

    .line 62
    :cond_26a
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->E()Z

    move-result v0

    if-eqz v0, :cond_28e

    .line 63
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v3, v3, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_31d

    .line 65
    :cond_28e
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_31d

    .line 66
    :cond_29d
    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    .line 67
    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v3, v3, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v2, v0, Lb/f/b/k/n/f;->b:Z

    .line 72
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31d

    .line 76
    :cond_2f0
    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-nez v0, :cond_2f7

    goto :goto_31d

    .line 77
    :cond_2f7
    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    .line 78
    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v3, v3, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v2, v0, Lb/f/b/k/n/f;->b:Z

    .line 81
    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-object v0, v0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    iget-object v3, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_31d
    :goto_31d
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v1

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_372

    aget-object v3, v3, v2

    iget-object v3, v3, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v3, :cond_372

    .line 84
    invoke-virtual {v0}, Lb/f/b/k/e;->E()Z

    move-result v0

    if-eqz v0, :cond_352

    .line 85
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v3, v1

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    .line 86
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lb/f/b/k/n/f;->f:I

    goto/16 :goto_3ee

    .line 87
    :cond_352
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    .line 88
    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v1, v2

    invoke-virtual {p0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v1

    .line 89
    invoke-virtual {v0, p0}, Lb/f/b/k/n/f;->b(Lb/f/b/k/n/d;)V

    .line 90
    invoke-virtual {v1, p0}, Lb/f/b/k/n/f;->b(Lb/f/b/k/n/d;)V

    .line 91
    sget-object v0, Lb/f/b/k/n/m$b;->CENTER:Lb/f/b/k/n/m$b;

    iput-object v0, p0, Lb/f/b/k/n/m;->j:Lb/f/b/k/n/m$b;

    goto/16 :goto_3ee

    .line 92
    :cond_372
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v0, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v4, v3, v1

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_39d

    .line 93
    aget-object v0, v3, v1

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_3ee

    .line 94
    iget-object v3, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v4, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v4, v4, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v1, v4, v1

    invoke-virtual {v1}, Lb/f/b/k/d;->a()I

    move-result v1

    invoke-virtual {p0, v3, v0, v1}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 95
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v2, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    goto :goto_3ee

    .line 96
    :cond_39d
    aget-object v1, v3, v2

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_3c6

    .line 97
    aget-object v0, v3, v2

    invoke-virtual {p0, v0}, Lb/f/b/k/n/m;->a(Lb/f/b/k/d;)Lb/f/b/k/n/f;

    move-result-object v0

    if-eqz v0, :cond_3ee

    .line 98
    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v3, v3, Lb/f/b/k/e;->I:[Lb/f/b/k/d;

    aget-object v2, v3, v2

    invoke-virtual {v2}, Lb/f/b/k/d;->a()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 99
    iget-object v0, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    const/4 v2, -0x1

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v2, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    goto :goto_3ee

    .line 100
    :cond_3c6
    instance-of v1, v0, Lb/f/b/k/i;

    if-nez v1, :cond_3ee

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_3ee

    .line 101
    iget-object v0, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 102
    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v3}, Lb/f/b/k/e;->B()I

    move-result v3

    invoke-virtual {p0, v1, v0, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;I)V

    .line 103
    iget-object v0, p0, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, p0, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v3, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {p0, v0, v1, v2, v3}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/f;Lb/f/b/k/n/f;ILb/f/b/k/n/g;)V

    :cond_3ee
    :goto_3ee
    return-void
.end method

.method public a(Lb/f/b/k/n/d;)V
    .registers 18

    move-object/from16 v8, p0

    .line 112
    sget-object v0, Lb/f/b/k/n/j$a;->a:[I

    iget-object v1, v8, Lb/f/b/k/n/m;->j:Lb/f/b/k/n/m$b;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eq v0, v9, :cond_29

    if-eq v0, v1, :cond_23

    if-eq v0, v2, :cond_17

    goto :goto_2e

    .line 113
    :cond_17
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v0, v0, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    move-object/from16 v3, p1

    invoke-virtual {v8, v3, v1, v0, v10}, Lb/f/b/k/n/m;->a(Lb/f/b/k/n/d;Lb/f/b/k/d;Lb/f/b/k/d;I)V

    return-void

    :cond_23
    move-object/from16 v3, p1

    .line 114
    invoke-virtual/range {p0 .. p1}, Lb/f/b/k/n/m;->b(Lb/f/b/k/n/d;)V

    goto :goto_2e

    :cond_29
    move-object/from16 v3, p1

    .line 115
    invoke-virtual/range {p0 .. p1}, Lb/f/b/k/n/m;->c(Lb/f/b/k/n/d;)V

    .line 116
    :goto_2e
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    const/high16 v11, 0x3f000000    # 0.5f

    if-nez v0, :cond_32e

    .line 117
    iget-object v0, v8, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v3, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v3, :cond_32e

    .line 118
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v3, v0, Lb/f/b/k/e;->j:I

    if-eq v3, v1, :cond_310

    if-eq v3, v2, :cond_46

    goto/16 :goto_32e

    .line 119
    :cond_46
    iget v1, v0, Lb/f/b/k/e;->k:I

    const/4 v3, -0x1

    if-eqz v1, :cond_8f

    if-ne v1, v2, :cond_4e

    goto :goto_8f

    .line 120
    :cond_4e
    invoke-virtual {v0}, Lb/f/b/k/e;->j()I

    move-result v0

    if-eq v0, v3, :cond_77

    if-eqz v0, :cond_68

    if-eq v0, v9, :cond_5a

    const/4 v0, 0x0

    goto :goto_88

    .line 121
    :cond_5a
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    int-to-float v1, v1

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    goto :goto_84

    .line 122
    :cond_68
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    int-to-float v1, v1

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    div-float/2addr v1, v0

    goto :goto_86

    .line 123
    :cond_77
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v1, v1, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    int-to-float v1, v1

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    :goto_84
    mul-float v1, v1, v0

    :goto_86
    add-float/2addr v1, v11

    float-to-int v0, v1

    .line 124
    :goto_88
    iget-object v1, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1, v0}, Lb/f/b/k/n/g;->a(I)V

    goto/16 :goto_32e

    .line 125
    :cond_8f
    :goto_8f
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v12, v1, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    .line 126
    iget-object v13, v1, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    .line 127
    iget-object v0, v0, Lb/f/b/k/e;->A:Lb/f/b/k/d;

    iget-object v0, v0, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v0, :cond_9f

    const/4 v0, 0x1

    goto :goto_a0

    :cond_9f
    const/4 v0, 0x0

    .line 128
    :goto_a0
    iget-object v1, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v1, v1, Lb/f/b/k/e;->B:Lb/f/b/k/d;

    iget-object v1, v1, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v1, :cond_aa

    const/4 v1, 0x1

    goto :goto_ab

    :cond_aa
    const/4 v1, 0x0

    .line 129
    :goto_ab
    iget-object v2, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v2, v2, Lb/f/b/k/e;->C:Lb/f/b/k/d;

    iget-object v2, v2, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v2, :cond_b5

    const/4 v2, 0x1

    goto :goto_b6

    :cond_b5
    const/4 v2, 0x0

    .line 130
    :goto_b6
    iget-object v4, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v4, v4, Lb/f/b/k/e;->D:Lb/f/b/k/d;

    iget-object v4, v4, Lb/f/b/k/d;->d:Lb/f/b/k/d;

    if-eqz v4, :cond_c0

    const/4 v4, 0x1

    goto :goto_c1

    :cond_c0
    const/4 v4, 0x0

    .line 131
    :goto_c1
    iget-object v5, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v5}, Lb/f/b/k/e;->j()I

    move-result v14

    if-eqz v0, :cond_20a

    if-eqz v1, :cond_20a

    if-eqz v2, :cond_20a

    if-eqz v4, :cond_20a

    .line 132
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v15

    .line 133
    iget-boolean v0, v12, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_138

    iget-boolean v0, v13, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_138

    .line 134
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->c:Z

    if-eqz v1, :cond_137

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v1, v1, Lb/f/b/k/n/f;->c:Z

    if-nez v1, :cond_ea

    goto :goto_137

    .line 135
    :cond_ea
    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    add-int v2, v0, v1

    .line 136
    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    sub-int v3, v0, v1

    .line 137
    iget v0, v12, Lb/f/b/k/n/f;->g:I

    iget v1, v12, Lb/f/b/k/n/f;->f:I

    add-int v4, v0, v1

    .line 138
    iget v0, v13, Lb/f/b/k/n/f;->g:I

    iget v1, v13, Lb/f/b/k/n/f;->f:I

    sub-int v5, v0, v1

    .line 139
    sget-object v1, Lb/f/b/k/n/j;->k:[I

    move-object/from16 v0, p0

    move v6, v15

    move v7, v14

    invoke-virtual/range {v0 .. v7}, Lb/f/b/k/n/j;->a([IIIIIFI)V

    .line 140
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v10

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 141
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v9

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    :cond_137
    :goto_137
    return-void

    .line 142
    :cond_138
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_195

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v2, v1, Lb/f/b/k/n/f;->j:Z

    if-eqz v2, :cond_195

    .line 143
    iget-boolean v2, v12, Lb/f/b/k/n/f;->c:Z

    if-eqz v2, :cond_194

    iget-boolean v2, v13, Lb/f/b/k/n/f;->c:Z

    if-nez v2, :cond_14d

    goto :goto_194

    .line 144
    :cond_14d
    iget v2, v0, Lb/f/b/k/n/f;->g:I

    iget v0, v0, Lb/f/b/k/n/f;->f:I

    add-int/2addr v2, v0

    .line 145
    iget v0, v1, Lb/f/b/k/n/f;->g:I

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    sub-int v3, v0, v1

    .line 146
    iget-object v0, v12, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget v1, v12, Lb/f/b/k/n/f;->f:I

    add-int v4, v0, v1

    .line 147
    iget-object v0, v13, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget v1, v13, Lb/f/b/k/n/f;->f:I

    sub-int v5, v0, v1

    .line 148
    sget-object v1, Lb/f/b/k/n/j;->k:[I

    move-object/from16 v0, p0

    move v6, v15

    move v7, v14

    invoke-virtual/range {v0 .. v7}, Lb/f/b/k/n/j;->a([IIIIIFI)V

    .line 149
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v10

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 150
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v9

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_195

    :cond_194
    :goto_194
    return-void

    .line 151
    :cond_195
    :goto_195
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->c:Z

    if-eqz v1, :cond_209

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v1, v1, Lb/f/b/k/n/f;->c:Z

    if-eqz v1, :cond_209

    iget-boolean v1, v12, Lb/f/b/k/n/f;->c:Z

    if-eqz v1, :cond_209

    iget-boolean v1, v13, Lb/f/b/k/n/f;->c:Z

    if-nez v1, :cond_1aa

    goto :goto_209

    .line 152
    :cond_1aa
    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    add-int v2, v0, v1

    .line 153
    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->f:I

    sub-int v3, v0, v1

    .line 154
    iget-object v0, v12, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget v1, v12, Lb/f/b/k/n/f;->f:I

    add-int v4, v0, v1

    .line 155
    iget-object v0, v13, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget v1, v13, Lb/f/b/k/n/f;->f:I

    sub-int v5, v0, v1

    .line 156
    sget-object v1, Lb/f/b/k/n/j;->k:[I

    move-object/from16 v0, p0

    move v6, v15

    move v7, v14

    invoke-virtual/range {v0 .. v7}, Lb/f/b/k/n/j;->a([IIIIIFI)V

    .line 157
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v10

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 158
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    sget-object v1, Lb/f/b/k/n/j;->k:[I

    aget v1, v1, v9

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto/16 :goto_32e

    :cond_209
    :goto_209
    return-void

    :cond_20a
    if-eqz v0, :cond_295

    if-eqz v2, :cond_295

    .line 159
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->c:Z

    if-eqz v0, :cond_294

    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->c:Z

    if-nez v0, :cond_21c

    goto/16 :goto_294

    .line 160
    :cond_21c
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    .line 161
    iget-object v1, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    iget-object v2, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v1, v2

    .line 162
    iget-object v2, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v2, v2, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    iget-object v4, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v4, v4, Lb/f/b/k/n/f;->f:I

    sub-int/2addr v2, v4

    if-eq v14, v3, :cond_270

    if-eqz v14, :cond_270

    if-eq v14, v9, :cond_24c

    goto/16 :goto_32e

    :cond_24c
    sub-int/2addr v2, v1

    .line 163
    invoke-virtual {v8, v2, v10}, Lb/f/b/k/n/m;->a(II)I

    move-result v1

    int-to-float v2, v1

    div-float/2addr v2, v0

    add-float/2addr v2, v11

    float-to-int v2, v2

    .line 164
    invoke-virtual {v8, v2, v9}, Lb/f/b/k/n/m;->a(II)I

    move-result v3

    if-eq v2, v3, :cond_260

    int-to-float v1, v3

    mul-float v1, v1, v0

    add-float/2addr v1, v11

    float-to-int v1, v1

    .line 165
    :cond_260
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 166
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v3}, Lb/f/b/k/n/g;->a(I)V

    goto/16 :goto_32e

    :cond_270
    sub-int/2addr v2, v1

    .line 167
    invoke-virtual {v8, v2, v10}, Lb/f/b/k/n/m;->a(II)I

    move-result v1

    int-to-float v2, v1

    mul-float v2, v2, v0

    add-float/2addr v2, v11

    float-to-int v2, v2

    .line 168
    invoke-virtual {v8, v2, v9}, Lb/f/b/k/n/m;->a(II)I

    move-result v3

    if-eq v2, v3, :cond_284

    int-to-float v1, v3

    div-float/2addr v1, v0

    add-float/2addr v1, v11

    float-to-int v1, v1

    .line 169
    :cond_284
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    .line 170
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v3}, Lb/f/b/k/n/g;->a(I)V

    goto/16 :goto_32e

    :cond_294
    :goto_294
    return-void

    :cond_295
    if-eqz v1, :cond_32e

    if-eqz v4, :cond_32e

    .line 171
    iget-boolean v0, v12, Lb/f/b/k/n/f;->c:Z

    if-eqz v0, :cond_30f

    iget-boolean v0, v13, Lb/f/b/k/n/f;->c:Z

    if-nez v0, :cond_2a2

    goto :goto_30f

    .line 172
    :cond_2a2
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v0}, Lb/f/b/k/e;->i()F

    move-result v0

    .line 173
    iget-object v1, v12, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    iget v2, v12, Lb/f/b/k/n/f;->f:I

    add-int/2addr v1, v2

    .line 174
    iget-object v2, v13, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    iget v4, v13, Lb/f/b/k/n/f;->f:I

    sub-int/2addr v2, v4

    if-eq v14, v3, :cond_2ec

    if-eqz v14, :cond_2c9

    if-eq v14, v9, :cond_2ec

    goto :goto_32e

    :cond_2c9
    sub-int/2addr v2, v1

    .line 175
    invoke-virtual {v8, v2, v9}, Lb/f/b/k/n/m;->a(II)I

    move-result v1

    int-to-float v2, v1

    mul-float v2, v2, v0

    add-float/2addr v2, v11

    float-to-int v2, v2

    .line 176
    invoke-virtual {v8, v2, v10}, Lb/f/b/k/n/m;->a(II)I

    move-result v3

    if-eq v2, v3, :cond_2dd

    int-to-float v1, v3

    div-float/2addr v1, v0

    add-float/2addr v1, v11

    float-to-int v1, v1

    .line 177
    :cond_2dd
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 178
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_32e

    :cond_2ec
    sub-int/2addr v2, v1

    .line 179
    invoke-virtual {v8, v2, v9}, Lb/f/b/k/n/m;->a(II)I

    move-result v1

    int-to-float v2, v1

    div-float/2addr v2, v0

    add-float/2addr v2, v11

    float-to-int v2, v2

    .line 180
    invoke-virtual {v8, v2, v10}, Lb/f/b/k/n/m;->a(II)I

    move-result v3

    if-eq v2, v3, :cond_300

    int-to-float v1, v3

    mul-float v1, v1, v0

    add-float/2addr v1, v11

    float-to-int v1, v1

    .line 181
    :cond_300
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v3}, Lb/f/b/k/n/g;->a(I)V

    .line 182
    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget-object v0, v0, Lb/f/b/k/e;->e:Lb/f/b/k/n/l;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/g;->a(I)V

    goto :goto_32e

    :cond_30f
    :goto_30f
    return-void

    .line 183
    :cond_310
    invoke-virtual {v0}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_32e

    .line 184
    iget-object v0, v0, Lb/f/b/k/e;->d:Lb/f/b/k/n/j;

    iget-object v0, v0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v1, :cond_32e

    .line 185
    iget-object v1, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v1, v1, Lb/f/b/k/e;->o:F

    .line 186
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    int-to-float v0, v0

    mul-float v0, v0, v1

    add-float/2addr v0, v11

    float-to-int v0, v0

    .line 187
    iget-object v1, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1, v0}, Lb/f/b/k/n/g;->a(I)V

    .line 188
    :cond_32e
    :goto_32e
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-boolean v1, v0, Lb/f/b/k/n/f;->c:Z

    if-eqz v1, :cond_450

    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-boolean v2, v1, Lb/f/b/k/n/f;->c:Z

    if-nez v2, :cond_33c

    goto/16 :goto_450

    .line 189
    :cond_33c
    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_34b

    iget-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_34b

    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_34b

    return-void

    .line 190
    :cond_34b
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_395

    iget-object v0, v8, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_395

    iget-object v0, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v1, v0, Lb/f/b/k/e;->j:I

    if-nez v1, :cond_395

    .line 191
    invoke-virtual {v0}, Lb/f/b/k/e;->E()Z

    move-result v0

    if-nez v0, :cond_395

    .line 192
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 193
    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/f;

    .line 194
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v2, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v3, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v0, v3

    .line 195
    iget v1, v1, Lb/f/b/k/n/f;->g:I

    iget-object v3, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v3, v3, Lb/f/b/k/n/f;->f:I

    add-int/2addr v1, v3

    sub-int v3, v1, v0

    .line 196
    invoke-virtual {v2, v0}, Lb/f/b/k/n/f;->a(I)V

    .line 197
    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    invoke-virtual {v0, v1}, Lb/f/b/k/n/f;->a(I)V

    .line 198
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0, v3}, Lb/f/b/k/n/g;->a(I)V

    return-void

    .line 199
    :cond_395
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_3f9

    iget-object v0, v8, Lb/f/b/k/n/m;->d:Lb/f/b/k/e$b;

    sget-object v1, Lb/f/b/k/e$b;->MATCH_CONSTRAINT:Lb/f/b/k/e$b;

    if-ne v0, v1, :cond_3f9

    iget v0, v8, Lb/f/b/k/n/m;->a:I

    if-ne v0, v9, :cond_3f9

    .line 200
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3f9

    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3f9

    .line 201
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 202
    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/f;

    .line 203
    iget v0, v0, Lb/f/b/k/n/f;->g:I

    iget-object v2, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v0, v2

    .line 204
    iget v1, v1, Lb/f/b/k/n/f;->g:I

    iget-object v2, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v2, v2, Lb/f/b/k/n/f;->f:I

    add-int/2addr v1, v2

    sub-int/2addr v1, v0

    .line 205
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/g;->m:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 206
    iget-object v1, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    iget v2, v1, Lb/f/b/k/e;->n:I

    .line 207
    iget v1, v1, Lb/f/b/k/e;->m:I

    .line 208
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-lez v2, :cond_3f4

    .line 209
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 210
    :cond_3f4
    iget-object v1, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v1, v0}, Lb/f/b/k/n/g;->a(I)V

    .line 211
    :cond_3f9
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget-boolean v0, v0, Lb/f/b/k/n/f;->j:Z

    if-nez v0, :cond_400

    return-void

    .line 212
    :cond_400
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget-object v0, v0, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/f;

    .line 213
    iget-object v1, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, v1, Lb/f/b/k/n/f;->l:Ljava/util/List;

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/f/b/k/n/f;

    .line 214
    iget v2, v0, Lb/f/b/k/n/f;->g:I

    iget-object v3, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v3, v3, Lb/f/b/k/n/f;->f:I

    add-int/2addr v2, v3

    .line 215
    iget v3, v1, Lb/f/b/k/n/f;->g:I

    iget-object v4, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget v4, v4, Lb/f/b/k/n/f;->f:I

    add-int/2addr v3, v4

    .line 216
    iget-object v4, v8, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v4}, Lb/f/b/k/e;->l()F

    move-result v4

    if-ne v0, v1, :cond_430

    .line 217
    iget v2, v0, Lb/f/b/k/n/f;->g:I

    .line 218
    iget v3, v1, Lb/f/b/k/n/f;->g:I

    const/high16 v4, 0x3f000000    # 0.5f

    :cond_430
    sub-int/2addr v3, v2

    .line 219
    iget-object v0, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v0, v0, Lb/f/b/k/n/f;->g:I

    sub-int/2addr v3, v0

    .line 220
    iget-object v0, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    int-to-float v1, v2

    add-float/2addr v1, v11

    int-to-float v2, v3

    mul-float v2, v2, v4

    add-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lb/f/b/k/n/f;->a(I)V

    .line 221
    iget-object v0, v8, Lb/f/b/k/n/m;->i:Lb/f/b/k/n/f;

    iget-object v1, v8, Lb/f/b/k/n/m;->h:Lb/f/b/k/n/f;

    iget v1, v1, Lb/f/b/k/n/f;->g:I

    iget-object v2, v8, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iget v2, v2, Lb/f/b/k/n/f;->g:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lb/f/b/k/n/f;->a(I)V

    :cond_450
    :goto_450
    return-void
.end method

.method public final a([IIIIIFI)V
    .registers 10

    sub-int/2addr p3, p2

    sub-int/2addr p5, p4

    const/4 p2, -0x1

    const/4 p4, 0x0

    const/high16 v0, 0x3f000000    # 0.5f

    const/4 v1, 0x1

    if-eq p7, p2, :cond_22

    if-eqz p7, :cond_18

    if-eq p7, v1, :cond_e

    goto :goto_3c

    :cond_e
    int-to-float p2, p3

    mul-float p2, p2, p6

    add-float/2addr p2, v0

    float-to-int p2, p2

    .line 104
    aput p3, p1, p4

    .line 105
    aput p2, p1, v1

    goto :goto_3c

    :cond_18
    int-to-float p2, p5

    mul-float p2, p2, p6

    add-float/2addr p2, v0

    float-to-int p2, p2

    .line 106
    aput p2, p1, p4

    .line 107
    aput p5, p1, v1

    goto :goto_3c

    :cond_22
    int-to-float p2, p5

    mul-float p2, p2, p6

    add-float/2addr p2, v0

    float-to-int p2, p2

    int-to-float p7, p3

    div-float/2addr p7, p6

    add-float/2addr p7, v0

    float-to-int p6, p7

    if-gt p2, p3, :cond_34

    if-gt p5, p5, :cond_34

    .line 108
    aput p2, p1, p4

    .line 109
    aput p5, p1, v1

    goto :goto_3c

    :cond_34
    if-gt p3, p3, :cond_3c

    if-gt p6, p5, :cond_3c

    .line 110
    aput p3, p1, p4

    .line 111
    aput p6, p1, v1

    :cond_3c
    :goto_3c
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

    invoke-virtual {v1, v0}, Lb/f/b/k/e;->r(I)V

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
    iget-object v0, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    invoke-virtual {v0}, Lb/f/b/k/n/f;->a()V

    const/4 v0, 0x0

    .line 5
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

    iget v0, v0, Lb/f/b/k/e;->j:I

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
    iget-object v1, p0, Lb/f/b/k/n/m;->e:Lb/f/b/k/n/g;

    iput-boolean v0, v1, Lb/f/b/k/n/f;->j:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HorizontalRun "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/f/b/k/n/m;->b:Lb/f/b/k/e;

    invoke-virtual {v1}, Lb/f/b/k/e;->h()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
