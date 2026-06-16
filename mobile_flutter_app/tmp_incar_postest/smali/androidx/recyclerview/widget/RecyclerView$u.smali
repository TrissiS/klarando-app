.class public final Landroidx/recyclerview/widget/RecyclerView$u;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "u"
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$b0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$b0;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView$b0;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$b0;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:Landroidx/recyclerview/widget/RecyclerView$t;

.field public h:Landroidx/recyclerview/widget/RecyclerView$z;

.field public final synthetic i:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 3
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    .line 5
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    .line 6
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->d:Ljava/util/List;

    const/4 p1, 0x2

    .line 7
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->e:I

    .line 8
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->f:I

    return-void
.end method


# virtual methods
.method public a(I)I
    .registers 5

    if-ltz p1, :cond_20

    .line 14
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v0

    if-ge p1, v0, :cond_20

    .line 15
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    if-nez v0, :cond_17

    return p1

    .line 16
    :cond_17
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v0, p1}, Lb/p/d/a;->c(I)I

    move-result p1

    return p1

    .line 17
    :cond_20
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ". State item count is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    .line 18
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(IZ)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 8

    .line 122
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_3b

    .line 123
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 124
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result v4

    if-nez v4, :cond_38

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->j()I

    move-result v4

    if-ne v4, p1, :cond_38

    .line 125
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v4

    if-nez v4, :cond_38

    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iget-boolean v4, v4, Landroidx/recyclerview/widget/RecyclerView$y;->h:Z

    if-nez v4, :cond_32

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result v4

    if-nez v4, :cond_38

    :cond_32
    const/16 p1, 0x20

    .line 126
    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    return-object v3

    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_3b
    if-nez p2, :cond_8d

    .line 127
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {v0, p1}, Lb/p/d/b;->b(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_8d

    .line 128
    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    .line 129
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {p2, v0}, Lb/p/d/b;->g(Landroid/view/View;)V

    .line 130
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {p2, v0}, Lb/p/d/b;->c(Landroid/view/View;)I

    move-result p2

    const/4 v1, -0x1

    if-eq p2, v1, :cond_6d

    .line 131
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {v1, p2}, Lb/p/d/b;->a(I)V

    .line 132
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->c(Landroid/view/View;)V

    const/16 p2, 0x2020

    .line 133
    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    return-object p1

    .line 134
    :cond_6d
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "layout index should not be -1 after unhiding a view:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 135
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 136
    :cond_8d
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_93
    if-ge v1, v0, :cond_ba

    .line 137
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 138
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v3

    if-nez v3, :cond_b7

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->j()I

    move-result v3

    if-ne v3, p1, :cond_b7

    .line 139
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->n()Z

    move-result v3

    if-nez v3, :cond_b7

    if-nez p2, :cond_b6

    .line 140
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_b6
    return-object v2

    :cond_b7
    add-int/lit8 v1, v1, 0x1

    goto :goto_93

    :cond_ba
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(IZJ)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 21

    move-object/from16 v6, p0

    move/from16 v3, p1

    move/from16 v0, p2

    if-ltz v3, :cond_22f

    .line 19
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v1

    if-ge v3, v1, :cond_22f

    .line 20
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v1, :cond_27

    .line 21
    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/RecyclerView$u;->b(I)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v1

    if-eqz v1, :cond_28

    const/4 v4, 0x1

    goto :goto_29

    :cond_27
    move-object v1, v2

    :cond_28
    const/4 v4, 0x0

    :goto_29
    if-nez v1, :cond_5d

    .line 22
    invoke-virtual/range {p0 .. p2}, Landroidx/recyclerview/widget/RecyclerView$u;->a(IZ)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v1

    if-eqz v1, :cond_5d

    .line 23
    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->f(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result v5

    if-nez v5, :cond_5c

    if-nez v0, :cond_5a

    const/4 v5, 0x4

    .line 24
    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    .line 25
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->s()Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 26
    iget-object v5, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v5, v9, v8}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 27
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->A()V

    goto :goto_57

    .line 28
    :cond_4e
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result v5

    if-eqz v5, :cond_57

    .line 29
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->c()V

    .line 30
    :cond_57
    :goto_57
    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->d(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    :cond_5a
    move-object v1, v2

    goto :goto_5d

    :cond_5c
    const/4 v4, 0x1

    :cond_5d
    :goto_5d
    if-nez v1, :cond_181

    .line 31
    iget-object v5, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v5, v3}, Lb/p/d/a;->c(I)I

    move-result v5

    if-ltz v5, :cond_149

    .line 32
    iget-object v9, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v9

    if-ge v5, v9, :cond_149

    .line 33
    iget-object v9, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v9, v9, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v9, v5}, Landroidx/recyclerview/widget/RecyclerView$g;->c(I)I

    move-result v9

    .line 34
    iget-object v10, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v10}, Landroidx/recyclerview/widget/RecyclerView$g;->e()Z

    move-result v10

    if-eqz v10, :cond_96

    .line 35
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/RecyclerView$g;->b(I)J

    move-result-wide v10

    invoke-virtual {v6, v10, v11, v9, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->a(JIZ)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v1

    if-eqz v1, :cond_96

    .line 36
    iput v5, v1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    const/4 v4, 0x1

    :cond_96
    if-nez v1, :cond_eb

    .line 37
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->h:Landroidx/recyclerview/widget/RecyclerView$z;

    if-eqz v0, :cond_eb

    .line 38
    invoke-virtual {v0, v6, v3, v9}, Landroidx/recyclerview/widget/RecyclerView$z;->a(Landroidx/recyclerview/widget/RecyclerView$u;II)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_eb

    .line 39
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->f(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v1

    if-eqz v1, :cond_ce

    .line 40
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->z()Z

    move-result v0

    if-nez v0, :cond_b1

    goto :goto_eb

    .line 41
    :cond_b1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getViewForPositionAndType returned a view that is ignored. You must call stopIgnoring before returning this view."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_ce
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getViewForPositionAndType returned a view which does not have a ViewHolder"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_eb
    :goto_eb
    if-nez v1, :cond_102

    .line 45
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/RecyclerView$u;->d()Landroidx/recyclerview/widget/RecyclerView$t;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/RecyclerView$t;->a(I)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v0

    if-eqz v0, :cond_101

    .line 46
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->w()V

    .line 47
    sget-boolean v1, Landroidx/recyclerview/widget/RecyclerView;->G0:Z

    if-eqz v1, :cond_101

    .line 48
    invoke-virtual {v6, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->c(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    :cond_101
    move-object v1, v0

    :cond_102
    if-nez v1, :cond_181

    .line 49
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v0

    const-wide v10, 0x7fffffffffffffffL

    cmp-long v5, p3, v10

    if-eqz v5, :cond_120

    .line 50
    iget-object v10, v6, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    move v11, v9

    move-wide v12, v0

    move-wide/from16 v14, p3

    .line 51
    invoke-virtual/range {v10 .. v15}, Landroidx/recyclerview/widget/RecyclerView$t;->b(IJJ)Z

    move-result v5

    if-nez v5, :cond_120

    return-object v2

    .line 52
    :cond_120
    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v2, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v5, v2, v9}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v2

    .line 53
    sget-boolean v5, Landroidx/recyclerview/widget/RecyclerView;->J0:Z

    if-eqz v5, :cond_13b

    .line 54
    iget-object v5, v2, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-static {v5}, Landroidx/recyclerview/widget/RecyclerView;->l(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v5

    if-eqz v5, :cond_13b

    .line 55
    new-instance v10, Ljava/lang/ref/WeakReference;

    invoke-direct {v10, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v10, v2, Landroidx/recyclerview/widget/RecyclerView$b0;->i:Ljava/lang/ref/WeakReference;

    .line 56
    :cond_13b
    iget-object v5, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v10

    .line 57
    iget-object v5, v6, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    sub-long/2addr v10, v0

    invoke-virtual {v5, v9, v10, v11}, Landroidx/recyclerview/widget/RecyclerView$t;->b(IJ)V

    move-object v9, v2

    goto :goto_182

    .line 58
    :cond_149
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inconsistency detected. Invalid item position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "(offset:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ").state:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    .line 59
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_181
    move-object v9, v1

    :goto_182
    move v10, v4

    if-eqz v10, :cond_1bb

    .line 60
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    if-nez v0, :cond_1bb

    const/16 v0, 0x2000

    .line 61
    invoke-virtual {v9, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->b(I)Z

    move-result v1

    if-eqz v1, :cond_1bb

    .line 62
    invoke-virtual {v9, v8, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(II)V

    .line 63
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iget-boolean v0, v0, Landroidx/recyclerview/widget/RecyclerView$y;->k:Z

    if-eqz v0, :cond_1bb

    .line 64
    invoke-static {v9}, Landroidx/recyclerview/widget/RecyclerView$l;->e(Landroidx/recyclerview/widget/RecyclerView$b0;)I

    move-result v0

    or-int/lit16 v0, v0, 0x1000

    .line 65
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->T:Landroidx/recyclerview/widget/RecyclerView$l;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    .line 66
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$b0;->l()Ljava/util/List;

    move-result-object v4

    .line 67
    invoke-virtual {v2, v1, v9, v0, v4}, Landroidx/recyclerview/widget/RecyclerView$l;->a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$b0;ILjava/util/List;)Landroidx/recyclerview/widget/RecyclerView$l$c;

    move-result-object v0

    .line 68
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v9, v0}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$l$c;)V

    .line 69
    :cond_1bb
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    if-eqz v0, :cond_1ce

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$b0;->o()Z

    move-result v0

    if-eqz v0, :cond_1ce

    .line 70
    iput v3, v9, Landroidx/recyclerview/widget/RecyclerView$b0;->n:I

    goto :goto_1e1

    .line 71
    :cond_1ce
    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$b0;->o()Z

    move-result v0

    if-eqz v0, :cond_1e3

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$b0;->v()Z

    move-result v0

    if-nez v0, :cond_1e3

    invoke-virtual {v9}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v0

    if-eqz v0, :cond_1e1

    goto :goto_1e3

    :cond_1e1
    :goto_1e1
    const/4 v0, 0x0

    goto :goto_1f6

    .line 72
    :cond_1e3
    :goto_1e3
    iget-object v0, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v0, v3}, Lb/p/d/a;->c(I)I

    move-result v2

    move-object/from16 v0, p0

    move-object v1, v9

    move/from16 v3, p1

    move-wide/from16 v4, p3

    .line 73
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroidx/recyclerview/widget/RecyclerView$b0;IIJ)Z

    move-result v0

    .line 74
    :goto_1f6
    iget-object v1, v9, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_20c

    .line 75
    iget-object v1, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 76
    iget-object v2, v9, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_224

    .line 77
    :cond_20c
    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v2

    if-nez v2, :cond_222

    .line 78
    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 79
    iget-object v2, v9, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_224

    .line 80
    :cond_222
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 81
    :goto_224
    iput-object v9, v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->a:Landroidx/recyclerview/widget/RecyclerView$b0;

    if-eqz v10, :cond_22b

    if-eqz v0, :cond_22b

    goto :goto_22c

    :cond_22b
    const/4 v7, 0x0

    .line 82
    :goto_22c
    iput-boolean v7, v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->d:Z

    return-object v9

    .line 83
    :cond_22f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid item position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "). Item count:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    .line 84
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v2, v6, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(JIZ)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 11

    .line 141
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_59

    .line 142
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 143
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->h()J

    move-result-wide v2

    cmp-long v4, v2, p1

    if-nez v4, :cond_56

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result v2

    if-nez v2, :cond_56

    .line 144
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->i()I

    move-result v2

    if-ne p3, v2, :cond_42

    const/16 p1, 0x20

    .line 145
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    .line 146
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result p1

    if-eqz p1, :cond_41

    .line 147
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p1

    if-nez p1, :cond_41

    const/4 p1, 0x2

    const/16 p2, 0xe

    .line 148
    invoke-virtual {v1, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(II)V

    :cond_41
    return-object v1

    :cond_42
    if-nez p4, :cond_56

    .line 149
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 150
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 151
    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroid/view/View;)V

    :cond_56
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 152
    :cond_59
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_61
    const/4 v1, 0x0

    if-ltz v0, :cond_91

    .line 153
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 154
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->h()J

    move-result-wide v3

    cmp-long v5, v3, p1

    if-nez v5, :cond_8e

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->n()Z

    move-result v3

    if-nez v3, :cond_8e

    .line 155
    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->i()I

    move-result v3

    if-ne p3, v3, :cond_88

    if-nez p4, :cond_87

    .line 156
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_87
    return-object v2

    :cond_88
    if-nez p4, :cond_8e

    .line 157
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    return-object v1

    :cond_8e
    add-int/lit8 v0, v0, -0x1

    goto :goto_61

    :cond_91
    return-object v1
.end method

.method public a()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->i()V

    return-void
.end method

.method public a(II)V
    .registers 7

    .line 160
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1e

    .line 161
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    if-eqz v2, :cond_1b

    .line 162
    iget v3, v2, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-lt v3, p1, :cond_1b

    const/4 v3, 0x1

    .line 163
    invoke-virtual {v2, p2, v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(IZ)V

    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1e
    return-void
.end method

.method public a(IIZ)V
    .registers 8

    add-int v0, p1, p2

    .line 164
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_a
    if-ltz v1, :cond_2c

    .line 165
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    if-eqz v2, :cond_29

    .line 166
    iget v3, v2, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-lt v3, v0, :cond_1f

    neg-int v3, p2

    .line 167
    invoke-virtual {v2, v3, p3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(IZ)V

    goto :goto_29

    :cond_1f
    if-lt v3, p1, :cond_29

    const/16 v3, 0x8

    .line 168
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    .line 169
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    :cond_29
    :goto_29
    add-int/lit8 v1, v1, -0x1

    goto :goto_a

    :cond_2c
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 117
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    const/4 v0, 0x0

    .line 118
    iput-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->u:Landroidx/recyclerview/widget/RecyclerView$u;

    const/4 v0, 0x0

    .line 119
    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->v:Z

    .line 120
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->c()V

    .line 121
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$u;->d(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final a(Landroid/view/ViewGroup;Z)V
    .registers 7

    .line 96
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_6
    if-ltz v0, :cond_18

    .line 97
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 98
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_15

    .line 99
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {p0, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroid/view/ViewGroup;Z)V

    :cond_15
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_18
    if-nez p2, :cond_1b

    return-void

    .line 100
    :cond_1b
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p2

    const/4 v0, 0x4

    if-ne p2, v0, :cond_2a

    const/4 p2, 0x0

    .line 101
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 102
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_34

    .line 103
    :cond_2a
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result p2

    .line 104
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 105
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    :goto_34
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 4

    .line 86
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->v()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 87
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    .line 88
    invoke-static {p1}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    .line 89
    invoke-static {p1, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 90
    :cond_14
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->v0:Lb/p/d/k;

    if-nez v0, :cond_1b

    return-void

    .line 91
    :cond_1b
    invoke-virtual {v0}, Lb/p/d/k;->b()Lb/h/m/a;

    move-result-object v0

    .line 92
    instance-of v1, v0, Lb/p/d/k$a;

    if-eqz v1, :cond_29

    .line 93
    move-object v1, v0

    check-cast v1, Lb/p/d/k$a;

    .line 94
    invoke-virtual {v1, p1}, Lb/p/d/k$a;->d(Landroid/view/View;)V

    .line 95
    :cond_29
    invoke-static {p1, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    :cond_2c
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    .registers 7

    .line 106
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->e(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 107
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    .line 108
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->v0:Lb/p/d/k;

    const/4 v2, 0x0

    if-eqz v1, :cond_1f

    .line 109
    invoke-virtual {v1}, Lb/p/d/k;->b()Lb/h/m/a;

    move-result-object v1

    .line 110
    instance-of v3, v1, Lb/p/d/k$a;

    if-eqz v3, :cond_1b

    .line 111
    check-cast v1, Lb/p/d/k$a;

    .line 112
    invoke-virtual {v1, v0}, Lb/p/d/k$a;->c(Landroid/view/View;)Lb/h/m/a;

    move-result-object v1

    goto :goto_1c

    :cond_1b
    move-object v1, v2

    .line 113
    :goto_1c
    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    :cond_1f
    if-eqz p2, :cond_24

    .line 114
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$u;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 115
    :cond_24
    iput-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->y:Landroidx/recyclerview/widget/RecyclerView;

    .line 116
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->d()Landroidx/recyclerview/widget/RecyclerView$t;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView$t;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$g;Landroidx/recyclerview/widget/RecyclerView$g;Z)V
    .registers 5

    .line 158
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->a()V

    .line 159
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->d()Landroidx/recyclerview/widget/RecyclerView$t;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->a(Landroidx/recyclerview/widget/RecyclerView$g;Landroidx/recyclerview/widget/RecyclerView$g;Z)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$t;)V
    .registers 3

    .line 171
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    if-eqz v0, :cond_7

    .line 172
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$t;->c()V

    .line 173
    :cond_7
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    if-eqz p1, :cond_18

    .line 174
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object p1

    if-eqz p1, :cond_18

    .line 175
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$t;->a()V

    :cond_18
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$z;)V
    .registers 2

    .line 170
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->h:Landroidx/recyclerview/widget/RecyclerView$z;

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$b0;IIJ)Z
    .registers 15

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->y:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->i()I

    move-result v2

    .line 5
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v7

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v3, p4, v0

    if-eqz v3, :cond_23

    .line 6
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    move-wide v3, v7

    move-wide v5, p4

    .line 7
    invoke-virtual/range {v1 .. v6}, Landroidx/recyclerview/widget/RecyclerView$t;->a(IJJ)Z

    move-result p4

    if-nez p4, :cond_23

    const/4 p1, 0x0

    return p1

    .line 8
    :cond_23
    iget-object p4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p4, p4, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {p4, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$b0;I)V

    .line 9
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide p4

    .line 10
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->i()I

    move-result v0

    sub-long/2addr p4, v7

    invoke-virtual {p2, v0, p4, p5}, Landroidx/recyclerview/widget/RecyclerView$t;->a(IJ)V

    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 12
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p2

    if-eqz p2, :cond_49

    .line 13
    iput p3, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->n:I

    :cond_49
    const/4 p1, 0x1

    return p1
.end method

.method public b(IZ)Landroid/view/View;
    .registers 5

    const-wide v0, 0x7fffffffffffffffL

    .line 1
    invoke-virtual {p0, p1, p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(IZJ)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    return-object p1
.end method

.method public b(I)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 11

    .line 12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_72

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_c

    goto :goto_72

    :cond_c
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_e
    const/16 v4, 0x20

    if-ge v3, v0, :cond_2d

    .line 13
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 14
    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result v6

    if-nez v6, :cond_2a

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$b0;->j()I

    move-result v6

    if-ne v6, p1, :cond_2a

    .line 15
    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    return-object v5

    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 16
    :cond_2d
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$g;->e()Z

    move-result v3

    if-eqz v3, :cond_72

    .line 17
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->k:Lb/p/d/a;

    invoke-virtual {v3, p1}, Lb/p/d/a;->c(I)I

    move-result p1

    if-lez p1, :cond_72

    .line 18
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v3

    if-ge p1, v3, :cond_72

    .line 19
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(I)J

    move-result-wide v5

    :goto_53
    if-ge v2, v0, :cond_72

    .line 20
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 21
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result v3

    if-nez v3, :cond_6f

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->h()J

    move-result-wide v7

    cmp-long v3, v7, v5

    if-nez v3, :cond_6f

    .line 22
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    return-object p1

    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    :cond_72
    :goto_72
    return-object v1
.end method

.method public b()V
    .registers 5

    .line 34
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_18

    .line 35
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 36
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 37
    :cond_18
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_1f
    if-ge v2, v0, :cond_2f

    .line 38
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 39
    :cond_2f
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_47

    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_37
    if-ge v1, v0, :cond_47

    .line 41
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->a()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_37

    :cond_47
    return-void
.end method

.method public b(II)V
    .registers 11

    if-ge p1, p2, :cond_6

    const/4 v0, -0x1

    move v1, p1

    move v2, p2

    goto :goto_9

    :cond_6
    const/4 v0, 0x1

    move v2, p1

    move v1, p2

    .line 29
    :goto_9
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_11
    if-ge v5, v3, :cond_32

    .line 30
    iget-object v6, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView$b0;

    if-eqz v6, :cond_2f

    .line 31
    iget v7, v6, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-lt v7, v1, :cond_2f

    if-le v7, v2, :cond_24

    goto :goto_2f

    :cond_24
    if-ne v7, p1, :cond_2c

    sub-int v7, p2, p1

    .line 32
    invoke-virtual {v6, v7, v4}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(IZ)V

    goto :goto_2f

    .line 33
    :cond_2c
    invoke-virtual {v6, v0, v4}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(IZ)V

    :cond_2f
    :goto_2f
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    :cond_32
    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 5

    .line 2
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->t()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 4
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 5
    :cond_10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->s()Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 6
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->A()V

    goto :goto_23

    .line 7
    :cond_1a
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->B()Z

    move-result p1

    if-eqz p1, :cond_23

    .line 8
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->c()V

    .line 9
    :cond_23
    :goto_23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->d(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 10
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->T:Landroidx/recyclerview/widget/RecyclerView$l;

    if-eqz p1, :cond_39

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->q()Z

    move-result p1

    if-nez p1, :cond_39

    .line 11
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->T:Landroidx/recyclerview/widget/RecyclerView$l;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$l;->c(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    :cond_39
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 4

    .line 23
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->u:Landroidx/recyclerview/widget/RecyclerView$v;

    if-eqz v0, :cond_9

    .line 24
    invoke-interface {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$v;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 25
    :cond_9
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v0, :cond_12

    .line 26
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->d(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 27
    :cond_12
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    if-eqz v1, :cond_1d

    .line 28
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Lb/p/d/p;

    invoke-virtual {v0, p1}, Lb/p/d/p;->h(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    :cond_1d
    return-void
.end method

.method public c(I)Landroid/view/View;
    .registers 3

    .line 15
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$b0;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    return-object p1
.end method

.method public c()V
    .registers 2

    .line 16
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 17
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    if-eqz v0, :cond_c

    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_c
    return-void
.end method

.method public c(II)V
    .registers 6

    add-int/2addr p2, p1

    .line 19
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_9
    if-ltz v0, :cond_26

    .line 20
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$b0;

    if-nez v1, :cond_16

    goto :goto_23

    .line 21
    :cond_16
    iget v2, v1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-lt v2, p1, :cond_23

    if-ge v2, p2, :cond_23

    const/4 v2, 0x2

    .line 22
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    .line 23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    :cond_23
    :goto_23
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    :cond_26
    return-void
.end method

.method public c(Landroid/view/View;)V
    .registers 4

    .line 3
    invoke-static {p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    const/16 v0, 0xc

    .line 4
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->b(I)Z

    move-result v0

    if-nez v0, :cond_30

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->u()Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_30

    .line 6
    :cond_1b
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    if-nez v0, :cond_26

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    :cond_26
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, p0, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(Landroidx/recyclerview/widget/RecyclerView$u;Z)V

    .line 9
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6d

    .line 10
    :cond_30
    :goto_30
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v0

    if-eqz v0, :cond_64

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result v0

    if-nez v0, :cond_64

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->e()Z

    move-result v0

    if-eqz v0, :cond_47

    goto :goto_64

    .line 11
    :cond_47
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_64
    :goto_64
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, p0, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(Landroidx/recyclerview/widget/RecyclerView$u;Z)V

    .line 14
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_6d
    return-void
.end method

.method public final c(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 3

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_c

    .line 2
    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroid/view/ViewGroup;Z)V

    :cond_c
    return-void
.end method

.method public d(I)Landroid/view/View;
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->b(IZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public d()Landroidx/recyclerview/widget/RecyclerView$t;
    .registers 2

    .line 29
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    if-nez v0, :cond_b

    .line 30
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$t;

    invoke-direct {v0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 31
    :cond_b
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    return-object v0
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 8

    .line 2
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->s()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_e9

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_12

    goto/16 :goto_e9

    .line 3
    :cond_12
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->t()Z

    move-result v0

    if-nez v0, :cond_c9

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->z()Z

    move-result v0

    if-nez v0, :cond_ac

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->f()Z

    move-result v0

    .line 6
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v3, :cond_32

    if-eqz v0, :cond_32

    .line 7
    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result v3

    if-eqz v3, :cond_32

    const/4 v3, 0x1

    goto :goto_33

    :cond_32
    const/4 v3, 0x0

    :goto_33
    if-nez v3, :cond_3e

    .line 8
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->q()Z

    move-result v3

    if-eqz v3, :cond_3c

    goto :goto_3e

    :cond_3c
    :goto_3c
    const/4 v2, 0x0

    goto :goto_9b

    .line 9
    :cond_3e
    :goto_3e
    iget v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->f:I

    if-lez v3, :cond_91

    const/16 v3, 0x20e

    .line 10
    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->b(I)Z

    move-result v3

    if-nez v3, :cond_91

    .line 11
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 12
    iget v4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->f:I

    if-lt v3, v4, :cond_5b

    if-lez v3, :cond_5b

    .line 13
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    add-int/lit8 v3, v3, -0x1

    .line 14
    :cond_5b
    sget-boolean v4, Landroidx/recyclerview/widget/RecyclerView;->J0:Z

    if-eqz v4, :cond_8a

    if-lez v3, :cond_8a

    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    iget v5, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    .line 15
    invoke-virtual {v4, v5}, Lb/p/d/e$b;->a(I)Z

    move-result v4

    if-nez v4, :cond_8a

    add-int/lit8 v3, v3, -0x1

    :goto_6f
    if-ltz v3, :cond_89

    .line 16
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView$b0;

    iget v4, v4, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    .line 17
    iget-object v5, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v5, v5, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    invoke-virtual {v5, v4}, Lb/p/d/e$b;->a(I)Z

    move-result v4

    if-nez v4, :cond_86

    goto :goto_89

    :cond_86
    add-int/lit8 v3, v3, -0x1

    goto :goto_6f

    :cond_89
    :goto_89
    add-int/2addr v3, v2

    .line 18
    :cond_8a
    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v4, v3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 v3, 0x1

    goto :goto_92

    :cond_91
    const/4 v3, 0x0

    :goto_92
    if-nez v3, :cond_99

    .line 19
    invoke-virtual {p0, p1, v2}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V

    move v1, v3

    goto :goto_9b

    :cond_99
    move v1, v3

    goto :goto_3c

    .line 20
    :goto_9b
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView;->m:Lb/p/d/p;

    invoke-virtual {v3, p1}, Lb/p/d/p;->h(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    if-nez v1, :cond_ab

    if-nez v2, :cond_ab

    if-eqz v0, :cond_ab

    const/4 v0, 0x0

    .line 21
    iput-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->y:Landroidx/recyclerview/widget/RecyclerView;

    :cond_ab
    return-void

    .line 22
    :cond_ac
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Trying to recycle an ignored view holder. You should first call stopIgnoringView(view) before calling recycle."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_c9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tmp detached view should be removed from RecyclerView before it can be recycled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_e9
    :goto_e9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Scrapped or attached views may not be recycled. isScrap:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->s()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " isAttached:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_10a

    const/4 v1, 0x1

    :cond_10a
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public e()I
    .registers 2

    .line 10
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public e(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$b0;

    const/4 v1, 0x1

    .line 2
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 3

    .line 4
    iget-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->v:Z

    if-eqz v0, :cond_a

    .line 5
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_f

    .line 6
    :cond_a
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_f
    const/4 v0, 0x0

    .line 7
    iput-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->u:Landroidx/recyclerview/widget/RecyclerView$u;

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->v:Z

    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->c()V

    return-void
.end method

.method public f()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$b0;",
            ">;"
        }
    .end annotation

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->d:Ljava/util/List;

    return-object v0
.end method

.method public f(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->e:I

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->j()V

    return-void
.end method

.method public f(Landroidx/recyclerview/widget/RecyclerView$b0;)Z
    .registers 9

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 5
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p1

    return p1

    .line 6
    :cond_f
    iget v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-ltz v0, :cond_59

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v1

    if-ge v0, v1, :cond_59

    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_39

    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    iget v2, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView$g;->c(I)I

    move-result v0

    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->i()I

    move-result v2

    if-eq v0, v2, :cond_39

    return v1

    .line 10
    :cond_39
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->e()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_58

    .line 11
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->h()J

    move-result-wide v3

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    iget p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(I)J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-nez p1, :cond_57

    const/4 v1, 0x1

    :cond_57
    return v1

    :cond_58
    return v2

    .line 12
    :cond_59
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inconsistency detected. Invalid view holder adapter position"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->n()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public g()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_21

    .line 2
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 3
    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    if-eqz v2, :cond_1e

    const/4 v3, 0x1

    .line 4
    iput-boolean v3, v2, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->c:Z

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_21
    return-void
.end method

.method public h()V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1e

    .line 2
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$b0;

    if-eqz v2, :cond_1b

    const/4 v3, 0x6

    .line 3
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(I)V

    const/4 v3, 0x0

    .line 4
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(Ljava/lang/Object;)V

    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 5
    :cond_1e
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->e()Z

    move-result v0

    if-nez v0, :cond_2d

    .line 6
    :cond_2a
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$u;->i()V

    :cond_2d
    return-void
.end method

.method public i()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_10

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 3
    :cond_10
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    sget-boolean v0, Landroidx/recyclerview/widget/RecyclerView;->J0:Z

    if-eqz v0, :cond_20

    .line 5
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    invoke-virtual {v0}, Lb/p/d/e$b;->a()V

    :cond_20
    return-void
.end method

.method public j()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Landroidx/recyclerview/widget/RecyclerView$o;

    if-eqz v0, :cond_9

    iget v0, v0, Landroidx/recyclerview/widget/RecyclerView$o;->m:I

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    .line 2
    :goto_a
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->e:I

    add-int/2addr v1, v0

    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->f:I

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_17
    if-ltz v0, :cond_29

    .line 4
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$u;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView$u;->f:I

    if-le v1, v2, :cond_29

    .line 5
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->e(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_17

    :cond_29
    return-void
.end method
