.class public Lb/b/p/j/g;
.super Ljava/lang/Object;
.source "MenuBuilder.java"

# interfaces
.implements Lb/h/g/a/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/p/j/g$b;,
        Lb/b/p/j/g$a;
    }
.end annotation


# static fields
.field public static final A:[I


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Landroid/content/res/Resources;

.field public c:Z

.field public d:Z

.field public e:Lb/b/p/j/g$a;

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:I

.field public m:Landroid/view/ContextMenu$ContextMenuInfo;

.field public n:Ljava/lang/CharSequence;

.field public o:Landroid/graphics/drawable/Drawable;

.field public p:Landroid/view/View;

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation
.end field

.field public w:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Lb/b/p/j/m;",
            ">;>;"
        }
    .end annotation
.end field

.field public x:Lb/b/p/j/i;

.field public y:Z

.field public z:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x6

    new-array v0, v0, [I

    .line 1
    fill-array-data v0, :array_a

    sput-object v0, Lb/b/p/j/g;->A:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1
        0x4
        0x5
        0x3
        0x2
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/b/p/j/g;->l:I

    .line 3
    iput-boolean v0, p0, Lb/b/p/j/g;->q:Z

    .line 4
    iput-boolean v0, p0, Lb/b/p/j/g;->r:Z

    .line 5
    iput-boolean v0, p0, Lb/b/p/j/g;->s:Z

    .line 6
    iput-boolean v0, p0, Lb/b/p/j/g;->t:Z

    .line 7
    iput-boolean v0, p0, Lb/b/p/j/g;->u:Z

    .line 8
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lb/b/p/j/g;->v:Ljava/util/ArrayList;

    .line 9
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    iput-boolean v0, p0, Lb/b/p/j/g;->y:Z

    .line 11
    iput-object p1, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    .line 14
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lb/b/p/j/g;->g:Ljava/util/ArrayList;

    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lb/b/p/j/g;->h:Z

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/b/p/j/g;->i:Ljava/util/ArrayList;

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    .line 18
    iput-boolean p1, p0, Lb/b/p/j/g;->k:Z

    .line 19
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->e(Z)V

    return-void
.end method

.method public static a(Ljava/util/ArrayList;I)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;I)I"
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_1a

    .line 47
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/b/p/j/i;

    .line 48
    invoke-virtual {v1}, Lb/b/p/j/i;->c()I

    move-result v1

    if-gt v1, p1, :cond_17

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public static f(I)I
    .registers 4

    const/high16 v0, -0x10000

    and-int/2addr v0, p0

    shr-int/lit8 v0, v0, 0x10

    if-ltz v0, :cond_16

    .line 2
    sget-object v1, Lb/b/p/j/g;->A:[I

    array-length v2, v1

    if-ge v0, v2, :cond_16

    .line 3
    aget v0, v1, v0

    shl-int/lit8 v0, v0, 0x10

    const v1, 0xffff

    and-int/2addr p0, v1

    or-int/2addr p0, v0

    return p0

    .line 4
    :cond_16
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "order does not contain a valid category."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public a(I)I
    .registers 3

    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, p1, v0}, Lb/b/p/j/g;->a(II)I

    move-result p1

    return p1
.end method

.method public a(II)I
    .registers 5

    .line 40
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    if-gez p2, :cond_7

    const/4 p2, 0x0

    :cond_7
    :goto_7
    if-ge p2, v0, :cond_1b

    .line 41
    iget-object v1, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/b/p/j/i;

    .line 42
    invoke-virtual {v1}, Lb/b/p/j/i;->getGroupId()I

    move-result v1

    if-ne v1, p1, :cond_18

    return p2

    :cond_18
    add-int/lit8 p2, p2, 0x1

    goto :goto_7

    :cond_1b
    const/4 p1, -0x1

    return p1
.end method

.method public a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 13

    .line 20
    invoke-static {p3}, Lb/b/p/j/g;->f(I)I

    move-result v7

    .line 21
    iget v6, p0, Lb/b/p/j/g;->l:I

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, v7

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lb/b/p/j/g;->a(IIIILjava/lang/CharSequence;I)Lb/b/p/j/i;

    move-result-object p1

    .line 22
    iget-object p2, p0, Lb/b/p/j/g;->m:Landroid/view/ContextMenu$ContextMenuInfo;

    if-eqz p2, :cond_17

    .line 23
    invoke-virtual {p1, p2}, Lb/b/p/j/i;->a(Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 24
    :cond_17
    iget-object p2, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-static {p2, v7}, Lb/b/p/j/g;->a(Ljava/util/ArrayList;I)I

    move-result p3

    invoke-virtual {p2, p3, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 p2, 0x1

    .line 25
    invoke-virtual {p0, p2}, Lb/b/p/j/g;->c(Z)V

    return-object p1
.end method

.method public a(Landroid/graphics/drawable/Drawable;)Lb/b/p/j/g;
    .registers 8

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v4, p1

    .line 112
    invoke-virtual/range {v0 .. v5}, Lb/b/p/j/g;->a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    return-object p0
.end method

.method public a(Landroid/view/View;)Lb/b/p/j/g;
    .registers 8

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v5, p1

    .line 113
    invoke-virtual/range {v0 .. v5}, Lb/b/p/j/g;->a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lb/b/p/j/g;
    .registers 8

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v2, p1

    .line 111
    invoke-virtual/range {v0 .. v5}, Lb/b/p/j/g;->a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    return-object p0
.end method

.method public final a(IIIILjava/lang/CharSequence;I)Lb/b/p/j/i;
    .registers 16

    .line 26
    new-instance v8, Lb/b/p/j/i;

    move-object v0, v8

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lb/b/p/j/i;-><init>(Lb/b/p/j/g;IIIILjava/lang/CharSequence;I)V

    return-object v8
.end method

.method public a(ILandroid/view/KeyEvent;)Lb/b/p/j/i;
    .registers 14

    .line 62
    iget-object v0, p0, Lb/b/p/j/g;->v:Ljava/util/ArrayList;

    .line 63
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 64
    invoke-virtual {p0, v0, p1, p2}, Lb/b/p/j/g;->a(Ljava/util/List;ILandroid/view/KeyEvent;)V

    .line 65
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_10

    return-object v2

    .line 66
    :cond_10
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v1

    .line 67
    new-instance v3, Landroid/view/KeyCharacterMap$KeyData;

    invoke-direct {v3}, Landroid/view/KeyCharacterMap$KeyData;-><init>()V

    .line 68
    invoke-virtual {p2, v3}, Landroid/view/KeyEvent;->getKeyData(Landroid/view/KeyCharacterMap$KeyData;)Z

    .line 69
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne p2, v4, :cond_2b

    .line 70
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    return-object p1

    .line 71
    :cond_2b
    invoke-virtual {p0}, Lb/b/p/j/g;->p()Z

    move-result v4

    const/4 v6, 0x0

    :goto_30
    if-ge v6, p2, :cond_66

    .line 72
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/b/p/j/i;

    if-eqz v4, :cond_3f

    .line 73
    invoke-virtual {v7}, Lb/b/p/j/i;->getAlphabeticShortcut()C

    move-result v8

    goto :goto_43

    .line 74
    :cond_3f
    invoke-virtual {v7}, Lb/b/p/j/i;->getNumericShortcut()C

    move-result v8

    .line 75
    :goto_43
    iget-object v9, v3, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    aget-char v9, v9, v5

    if-ne v8, v9, :cond_4d

    and-int/lit8 v9, v1, 0x2

    if-eqz v9, :cond_62

    :cond_4d
    iget-object v9, v3, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    const/4 v10, 0x2

    aget-char v9, v9, v10

    if-ne v8, v9, :cond_58

    and-int/lit8 v9, v1, 0x2

    if-nez v9, :cond_62

    :cond_58
    if-eqz v4, :cond_63

    const/16 v9, 0x8

    if-ne v8, v9, :cond_63

    const/16 v8, 0x43

    if-ne p1, v8, :cond_63

    :cond_62
    return-object v7

    :cond_63
    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    :cond_66
    return-object v2
.end method

.method public a()V
    .registers 2

    .line 44
    iget-object v0, p0, Lb/b/p/j/g;->e:Lb/b/p/j/g$a;

    if-eqz v0, :cond_7

    .line 45
    invoke-interface {v0, p0}, Lb/b/p/j/g$a;->a(Lb/b/p/j/g;)V

    :cond_7
    return-void
.end method

.method public final a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V
    .registers 8

    .line 101
    invoke-virtual {p0}, Lb/b/p/j/g;->l()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p5, :cond_e

    .line 102
    iput-object p5, p0, Lb/b/p/j/g;->p:Landroid/view/View;

    .line 103
    iput-object v1, p0, Lb/b/p/j/g;->n:Ljava/lang/CharSequence;

    .line 104
    iput-object v1, p0, Lb/b/p/j/g;->o:Landroid/graphics/drawable/Drawable;

    goto :goto_2e

    :cond_e
    if-lez p1, :cond_17

    .line 105
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/g;->n:Ljava/lang/CharSequence;

    goto :goto_1b

    :cond_17
    if-eqz p2, :cond_1b

    .line 106
    iput-object p2, p0, Lb/b/p/j/g;->n:Ljava/lang/CharSequence;

    :cond_1b
    :goto_1b
    if-lez p3, :cond_28

    .line 107
    invoke-virtual {p0}, Lb/b/p/j/g;->e()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p3}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/g;->o:Landroid/graphics/drawable/Drawable;

    goto :goto_2c

    :cond_28
    if-eqz p4, :cond_2c

    .line 108
    iput-object p4, p0, Lb/b/p/j/g;->o:Landroid/graphics/drawable/Drawable;

    .line 109
    :cond_2c
    :goto_2c
    iput-object v1, p0, Lb/b/p/j/g;->p:Landroid/view/View;

    :goto_2e
    const/4 p1, 0x0

    .line 110
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public final a(IZ)V
    .registers 4

    if-ltz p1, :cond_16

    .line 27
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_b

    goto :goto_16

    .line 28
    :cond_b
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    if-eqz p2, :cond_16

    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    :cond_16
    :goto_16
    return-void
.end method

.method public final a(Landroid/os/Bundle;)V
    .registers 5

    const-string v0, "android:menu:presenters"

    .line 11
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object p1

    if-eqz p1, :cond_43

    .line 12
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_43

    .line 13
    :cond_11
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 14
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/m;

    if-nez v2, :cond_31

    .line 15
    iget-object v2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_17

    .line 16
    :cond_31
    invoke-interface {v2}, Lb/b/p/j/m;->a()I

    move-result v1

    if-lez v1, :cond_17

    .line 17
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    if-eqz v1, :cond_17

    .line 18
    invoke-interface {v2, v1}, Lb/b/p/j/m;->a(Landroid/os/Parcelable;)V

    goto :goto_17

    :cond_43
    :goto_43
    return-void
.end method

.method public a(Landroid/view/MenuItem;)V
    .registers 8

    .line 30
    invoke-interface {p1}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    .line 31
    iget-object v1, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 32
    invoke-virtual {p0}, Lb/b/p/j/g;->s()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v1, :cond_38

    .line 33
    iget-object v4, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    .line 34
    invoke-virtual {v4}, Lb/b/p/j/i;->getGroupId()I

    move-result v5

    if-ne v5, v0, :cond_35

    .line 35
    invoke-virtual {v4}, Lb/b/p/j/i;->i()Z

    move-result v5

    if-nez v5, :cond_26

    goto :goto_35

    .line 36
    :cond_26
    invoke-virtual {v4}, Lb/b/p/j/i;->isCheckable()Z

    move-result v5

    if-nez v5, :cond_2d

    goto :goto_35

    :cond_2d
    if-ne v4, p1, :cond_31

    const/4 v5, 0x1

    goto :goto_32

    :cond_31
    const/4 v5, 0x0

    .line 37
    :goto_32
    invoke-virtual {v4, v5}, Lb/b/p/j/i;->b(Z)V

    :cond_35
    :goto_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 38
    :cond_38
    invoke-virtual {p0}, Lb/b/p/j/g;->r()V

    return-void
.end method

.method public a(Lb/b/p/j/g$a;)V
    .registers 2

    .line 19
    iput-object p1, p0, Lb/b/p/j/g;->e:Lb/b/p/j/g$a;

    return-void
.end method

.method public a(Lb/b/p/j/m;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    invoke-virtual {p0, p1, v0}, Lb/b/p/j/g;->a(Lb/b/p/j/m;Landroid/content/Context;)V

    return-void
.end method

.method public a(Lb/b/p/j/m;Landroid/content/Context;)V
    .registers 5

    .line 2
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    invoke-interface {p1, p2, p0}, Lb/b/p/j/m;->a(Landroid/content/Context;Lb/b/p/j/g;)V

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lb/b/p/j/g;->k:Z

    return-void
.end method

.method public a(Ljava/util/List;ILandroid/view/KeyEvent;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lb/b/p/j/i;",
            ">;I",
            "Landroid/view/KeyEvent;",
            ")V"
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lb/b/p/j/g;->p()Z

    move-result v0

    .line 50
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getModifiers()I

    move-result v1

    .line 51
    new-instance v2, Landroid/view/KeyCharacterMap$KeyData;

    invoke-direct {v2}, Landroid/view/KeyCharacterMap$KeyData;-><init>()V

    .line 52
    invoke-virtual {p3, v2}, Landroid/view/KeyEvent;->getKeyData(Landroid/view/KeyCharacterMap$KeyData;)Z

    move-result v3

    const/16 v4, 0x43

    if-nez v3, :cond_18

    if-eq p2, v4, :cond_18

    return-void

    .line 53
    :cond_18
    iget-object v3, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_20
    if-ge v6, v3, :cond_7d

    .line 54
    iget-object v7, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/b/p/j/i;

    .line 55
    invoke-virtual {v7}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result v8

    if-eqz v8, :cond_39

    .line 56
    invoke-virtual {v7}, Lb/b/p/j/i;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v8

    check-cast v8, Lb/b/p/j/g;

    invoke-virtual {v8, p1, p2, p3}, Lb/b/p/j/g;->a(Ljava/util/List;ILandroid/view/KeyEvent;)V

    :cond_39
    if-eqz v0, :cond_40

    .line 57
    invoke-virtual {v7}, Lb/b/p/j/i;->getAlphabeticShortcut()C

    move-result v8

    goto :goto_44

    :cond_40
    invoke-virtual {v7}, Lb/b/p/j/i;->getNumericShortcut()C

    move-result v8

    :goto_44
    if-eqz v0, :cond_4b

    .line 58
    invoke-virtual {v7}, Lb/b/p/j/i;->getAlphabeticModifiers()I

    move-result v9

    goto :goto_4f

    :cond_4b
    invoke-virtual {v7}, Lb/b/p/j/i;->getNumericModifiers()I

    move-result v9

    :goto_4f
    const v10, 0x1100f

    and-int v11, v1, v10

    and-int/2addr v9, v10

    if-ne v11, v9, :cond_59

    const/4 v9, 0x1

    goto :goto_5a

    :cond_59
    const/4 v9, 0x0

    :goto_5a
    if-eqz v9, :cond_7a

    if-eqz v8, :cond_7a

    .line 59
    iget-object v9, v2, Landroid/view/KeyCharacterMap$KeyData;->meta:[C

    aget-char v10, v9, v5

    if-eq v8, v10, :cond_71

    const/4 v10, 0x2

    aget-char v9, v9, v10

    if-eq v8, v9, :cond_71

    if-eqz v0, :cond_7a

    const/16 v9, 0x8

    if-ne v8, v9, :cond_7a

    if-ne p2, v4, :cond_7a

    .line 60
    :cond_71
    invoke-virtual {v7}, Lb/b/p/j/i;->isEnabled()Z

    move-result v8

    if-eqz v8, :cond_7a

    .line 61
    invoke-interface {p1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7a
    add-int/lit8 v6, v6, 0x1

    goto :goto_20

    :cond_7d
    return-void
.end method

.method public final a(Z)V
    .registers 5

    .line 94
    iget-boolean v0, p0, Lb/b/p/j/g;->u:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 95
    iput-boolean v0, p0, Lb/b/p/j/g;->u:Z

    .line 96
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 97
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/m;

    if-nez v2, :cond_28

    .line 98
    iget-object v2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 99
    :cond_28
    invoke-interface {v2, p0, p1}, Lb/b/p/j/m;->a(Lb/b/p/j/g;Z)V

    goto :goto_e

    :cond_2c
    const/4 p1, 0x0

    .line 100
    iput-boolean p1, p0, Lb/b/p/j/g;->u:Z

    return-void
.end method

.method public a(Landroid/view/MenuItem;I)Z
    .registers 4

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, p1, v0, p2}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z
    .registers 10

    .line 77
    check-cast p1, Lb/b/p/j/i;

    const/4 v0, 0x0

    if-eqz p1, :cond_71

    .line 78
    invoke-virtual {p1}, Lb/b/p/j/i;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_c

    goto :goto_71

    .line 79
    :cond_c
    invoke-virtual {p1}, Lb/b/p/j/i;->g()Z

    move-result v1

    .line 80
    invoke-virtual {p1}, Lb/b/p/j/i;->a()Lb/h/m/b;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1f

    .line 81
    invoke-virtual {v2}, Lb/h/m/b;->a()Z

    move-result v4

    if-eqz v4, :cond_1f

    const/4 v4, 0x1

    goto :goto_20

    :cond_1f
    const/4 v4, 0x0

    .line 82
    :goto_20
    invoke-virtual {p1}, Lb/b/p/j/i;->f()Z

    move-result v5

    if-eqz v5, :cond_31

    .line 83
    invoke-virtual {p1}, Lb/b/p/j/i;->expandActionView()Z

    move-result p1

    or-int/2addr v1, p1

    if-eqz v1, :cond_70

    .line 84
    invoke-virtual {p0, v3}, Lb/b/p/j/g;->a(Z)V

    goto :goto_70

    .line 85
    :cond_31
    invoke-virtual {p1}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result v5

    if-nez v5, :cond_42

    if-eqz v4, :cond_3a

    goto :goto_42

    :cond_3a
    and-int/lit8 p1, p3, 0x1

    if-nez p1, :cond_70

    .line 86
    invoke-virtual {p0, v3}, Lb/b/p/j/g;->a(Z)V

    goto :goto_70

    :cond_42
    :goto_42
    and-int/lit8 p3, p3, 0x4

    if-nez p3, :cond_49

    .line 87
    invoke-virtual {p0, v0}, Lb/b/p/j/g;->a(Z)V

    .line 88
    :cond_49
    invoke-virtual {p1}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result p3

    if-nez p3, :cond_5b

    .line 89
    new-instance p3, Lb/b/p/j/r;

    invoke-virtual {p0}, Lb/b/p/j/g;->e()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p3, v0, p0, p1}, Lb/b/p/j/r;-><init>(Landroid/content/Context;Lb/b/p/j/g;Lb/b/p/j/i;)V

    invoke-virtual {p1, p3}, Lb/b/p/j/i;->a(Lb/b/p/j/r;)V

    .line 90
    :cond_5b
    invoke-virtual {p1}, Lb/b/p/j/i;->getSubMenu()Landroid/view/SubMenu;

    move-result-object p1

    check-cast p1, Lb/b/p/j/r;

    if-eqz v4, :cond_66

    .line 91
    invoke-virtual {v2, p1}, Lb/h/m/b;->a(Landroid/view/SubMenu;)V

    .line 92
    :cond_66
    invoke-virtual {p0, p1, p2}, Lb/b/p/j/g;->a(Lb/b/p/j/r;Lb/b/p/j/m;)Z

    move-result p1

    or-int/2addr v1, p1

    if-nez v1, :cond_70

    .line 93
    invoke-virtual {p0, v3}, Lb/b/p/j/g;->a(Z)V

    :cond_70
    :goto_70
    return v1

    :cond_71
    :goto_71
    return v0
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 4

    .line 43
    iget-object v0, p0, Lb/b/p/j/g;->e:Lb/b/p/j/g$a;

    if-eqz v0, :cond_c

    invoke-interface {v0, p1, p2}, Lb/b/p/j/g$a;->a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public a(Lb/b/p/j/i;)Z
    .registers 6

    .line 114
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3f

    iget-object v0, p0, Lb/b/p/j/g;->x:Lb/b/p/j/i;

    if-eq v0, p1, :cond_e

    goto :goto_3f

    .line 115
    :cond_e
    invoke-virtual {p0}, Lb/b/p/j/g;->s()V

    .line 116
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 117
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/m;

    if-nez v3, :cond_31

    .line 118
    iget-object v3, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_17

    .line 119
    :cond_31
    invoke-interface {v3, p0, p1}, Lb/b/p/j/m;->a(Lb/b/p/j/g;Lb/b/p/j/i;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 120
    :cond_37
    invoke-virtual {p0}, Lb/b/p/j/g;->r()V

    if-eqz v1, :cond_3f

    const/4 p1, 0x0

    .line 121
    iput-object p1, p0, Lb/b/p/j/g;->x:Lb/b/p/j/i;

    :cond_3f
    :goto_3f
    return v1
.end method

.method public final a(Lb/b/p/j/r;Lb/b/p/j/m;)Z
    .registers 6

    .line 5
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    return v1

    :cond_a
    if-eqz p2, :cond_10

    .line 6
    invoke-interface {p2, p1}, Lb/b/p/j/m;->a(Lb/b/p/j/r;)Z

    move-result v1

    .line 7
    :cond_10
    iget-object p2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_16
    :goto_16
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 8
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/m;

    if-nez v2, :cond_30

    .line 9
    iget-object v2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_16

    :cond_30
    if-nez v1, :cond_16

    .line 10
    invoke-interface {v2, p1}, Lb/b/p/j/m;->a(Lb/b/p/j/r;)Z

    move-result v0

    move v1, v0

    goto :goto_16

    :cond_38
    return v1
.end method

.method public add(I)Landroid/view/MenuItem;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    return-object p1
.end method

.method public add(IIII)Landroid/view/MenuItem;
    .registers 6

    .line 4
    iget-object v0, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    return-object p1
.end method

.method public add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 5

    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    return-object p1
.end method

.method public add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, v0, v0, p1}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    return-object p1
.end method

.method public addIntentOptions(IIILandroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I[Landroid/view/MenuItem;)I
    .registers 16

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-virtual {v0, p4, p5, p6, v1}, Landroid/content/pm/PackageManager;->queryIntentActivityOptions(Landroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p4

    if-eqz p4, :cond_12

    .line 3
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v2

    goto :goto_13

    :cond_12
    const/4 v2, 0x0

    :goto_13
    and-int/lit8 p7, p7, 0x1

    if-nez p7, :cond_1a

    .line 4
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->removeGroup(I)V

    :cond_1a
    :goto_1a
    if-ge v1, v2, :cond_5e

    .line 5
    invoke-interface {p4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p7

    check-cast p7, Landroid/content/pm/ResolveInfo;

    .line 6
    new-instance v3, Landroid/content/Intent;

    .line 7
    iget v4, p7, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-gez v4, :cond_2a

    move-object v4, p6

    goto :goto_2c

    :cond_2a
    aget-object v4, p5, v4

    :goto_2c
    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 8
    new-instance v4, Landroid/content/ComponentName;

    iget-object v5, p7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v5, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v4, v6, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 9
    invoke-virtual {p7, v0}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {p0, p1, p2, p3, v4}, Lb/b/p/j/g;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v4

    .line 10
    invoke-virtual {p7, v0}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-interface {v4, v5}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v4

    .line 11
    invoke-interface {v4, v3}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v3

    if-eqz p8, :cond_5b

    .line 12
    iget p7, p7, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-ltz p7, :cond_5b

    .line 13
    aput-object v3, p8, p7

    :cond_5b
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_5e
    return v2
.end method

.method public addSubMenu(I)Landroid/view/SubMenu;
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Lb/b/p/j/g;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object p1

    return-object p1
.end method

.method public addSubMenu(IIII)Landroid/view/SubMenu;
    .registers 6

    .line 6
    iget-object v0, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object p1

    return-object p1
.end method

.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 5

    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lb/b/p/j/g;->a(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    .line 4
    new-instance p2, Lb/b/p/j/r;

    iget-object p3, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    invoke-direct {p2, p3, p0, p1}, Lb/b/p/j/r;-><init>(Landroid/content/Context;Lb/b/p/j/g;Lb/b/p/j/i;)V

    .line 5
    invoke-virtual {p1, p2}, Lb/b/p/j/i;->a(Lb/b/p/j/r;)V

    return-object p2
.end method

.method public addSubMenu(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0, v0, v0, p1}, Lb/b/p/j/g;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object p1

    return-object p1
.end method

.method public b(I)I
    .registers 5

    .line 20
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_19

    .line 21
    iget-object v2, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/i;

    .line 22
    invoke-virtual {v2}, Lb/b/p/j/i;->getItemId()I

    move-result v2

    if-ne v2, p1, :cond_16

    return v1

    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_19
    const/4 p1, -0x1

    return p1
.end method

.method public b()V
    .registers 7

    .line 23
    invoke-virtual {p0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v0

    .line 24
    iget-boolean v1, p0, Lb/b/p/j/g;->k:Z

    if-nez v1, :cond_9

    return-void

    .line 25
    :cond_9
    iget-object v1, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/WeakReference;

    .line 26
    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/b/p/j/m;

    if-nez v5, :cond_2b

    .line 27
    iget-object v5, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_11

    .line 28
    :cond_2b
    invoke-interface {v5}, Lb/b/p/j/m;->c()Z

    move-result v4

    or-int/2addr v3, v4

    goto :goto_11

    :cond_31
    if-eqz v3, :cond_5e

    .line 29
    iget-object v1, p0, Lb/b/p/j/g;->i:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 30
    iget-object v1, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_42
    if-ge v3, v1, :cond_71

    .line 32
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    .line 33
    invoke-virtual {v4}, Lb/b/p/j/i;->h()Z

    move-result v5

    if-eqz v5, :cond_56

    .line 34
    iget-object v5, p0, Lb/b/p/j/g;->i:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5b

    .line 35
    :cond_56
    iget-object v5, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_5b
    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    .line 36
    :cond_5e
    iget-object v0, p0, Lb/b/p/j/g;->i:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 37
    iget-object v0, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 38
    iget-object v0, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 39
    :cond_71
    iput-boolean v2, p0, Lb/b/p/j/g;->k:Z

    return-void
.end method

.method public final b(Landroid/os/Bundle;)V
    .registers 6

    .line 11
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 12
    :cond_9
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 13
    iget-object v1, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 14
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/m;

    if-nez v3, :cond_2e

    .line 15
    iget-object v3, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_14

    .line 16
    :cond_2e
    invoke-interface {v3}, Lb/b/p/j/m;->a()I

    move-result v2

    if-lez v2, :cond_14

    .line 17
    invoke-interface {v3}, Lb/b/p/j/m;->d()Landroid/os/Parcelable;

    move-result-object v3

    if-eqz v3, :cond_14

    .line 18
    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_14

    :cond_3e
    const-string v1, "android:menu:presenters"

    .line 19
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-void
.end method

.method public b(Lb/b/p/j/m;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 2
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/m;

    if-eqz v2, :cond_1c

    if-ne v2, p1, :cond_6

    .line 3
    :cond_1c
    iget-object v2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_22
    return-void
.end method

.method public final b(Z)V
    .registers 5

    .line 4
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 5
    :cond_9
    invoke-virtual {p0}, Lb/b/p/j/g;->s()V

    .line 6
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 7
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/m;

    if-nez v2, :cond_2c

    .line 8
    iget-object v2, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_12

    .line 9
    :cond_2c
    invoke-interface {v2, p1}, Lb/b/p/j/m;->a(Z)V

    goto :goto_12

    .line 10
    :cond_30
    invoke-virtual {p0}, Lb/b/p/j/g;->r()V

    return-void
.end method

.method public b(Lb/b/p/j/i;)Z
    .registers 6

    .line 40
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    return v1

    .line 41
    :cond_a
    invoke-virtual {p0}, Lb/b/p/j/g;->s()V

    .line 42
    iget-object v0, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_13
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 43
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/m;

    if-nez v3, :cond_2d

    .line 44
    iget-object v3, p0, Lb/b/p/j/g;->w:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_13

    .line 45
    :cond_2d
    invoke-interface {v3, p0, p1}, Lb/b/p/j/m;->b(Lb/b/p/j/g;Lb/b/p/j/i;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 46
    :cond_33
    invoke-virtual {p0}, Lb/b/p/j/g;->r()V

    if-eqz v1, :cond_3a

    .line 47
    iput-object p1, p0, Lb/b/p/j/g;->x:Lb/b/p/j/i;

    :cond_3a
    return v1
.end method

.method public c(I)Lb/b/p/j/g;
    .registers 2

    .line 1
    iput p1, p0, Lb/b/p/j/g;->l:I

    return-object p0
.end method

.method public c()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Lb/b/p/j/g;->b()V

    .line 24
    iget-object v0, p0, Lb/b/p/j/g;->i:Ljava/util/ArrayList;

    return-object v0
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 9

    if-nez p1, :cond_3

    return-void

    .line 2
    :cond_3
    invoke-virtual {p0}, Lb/b/p/j/g;->d()Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v0

    .line 4
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v1, :cond_38

    .line 5
    invoke-virtual {p0, v2}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 6
    invoke-interface {v3}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_26

    .line 7
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_26

    .line 8
    invoke-virtual {v4, v0}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 9
    :cond_26
    invoke-interface {v3}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v4

    if-eqz v4, :cond_35

    .line 10
    invoke-interface {v3}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v3

    check-cast v3, Lb/b/p/j/r;

    .line 11
    invoke-virtual {v3, p1}, Lb/b/p/j/g;->c(Landroid/os/Bundle;)V

    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    :cond_38
    const-string v0, "android:menu:expandedactionview"

    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_49

    .line 13
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_49

    .line 14
    invoke-interface {p1}, Landroid/view/MenuItem;->expandActionView()Z

    :cond_49
    return-void
.end method

.method public c(Lb/b/p/j/i;)V
    .registers 2

    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Lb/b/p/j/g;->k:Z

    .line 22
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public c(Z)V
    .registers 4

    .line 15
    iget-boolean v0, p0, Lb/b/p/j/g;->q:Z

    const/4 v1, 0x1

    if-nez v0, :cond_f

    if-eqz p1, :cond_b

    .line 16
    iput-boolean v1, p0, Lb/b/p/j/g;->h:Z

    .line 17
    iput-boolean v1, p0, Lb/b/p/j/g;->k:Z

    .line 18
    :cond_b
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->b(Z)V

    goto :goto_15

    .line 19
    :cond_f
    iput-boolean v1, p0, Lb/b/p/j/g;->r:Z

    if-eqz p1, :cond_15

    .line 20
    iput-boolean v1, p0, Lb/b/p/j/g;->s:Z

    :cond_15
    :goto_15
    return-void
.end method

.method public clear()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->x:Lb/b/p/j/i;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {p0, v0}, Lb/b/p/j/g;->a(Lb/b/p/j/i;)Z

    .line 3
    :cond_7
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public clearHeader()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lb/b/p/j/g;->o:Landroid/graphics/drawable/Drawable;

    .line 2
    iput-object v0, p0, Lb/b/p/j/g;->n:Ljava/lang/CharSequence;

    .line 3
    iput-object v0, p0, Lb/b/p/j/g;->p:Landroid/view/View;

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public close()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lb/b/p/j/g;->a(Z)V

    return-void
.end method

.method public d(I)Lb/b/p/j/g;
    .registers 8

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v3, p1

    .line 4
    invoke-virtual/range {v0 .. v5}, Lb/b/p/j/g;->a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    return-object p0
.end method

.method public d()Ljava/lang/String;
    .registers 2

    const-string v0, "android:menu:actionviewstates"

    return-object v0
.end method

.method public d(Landroid/os/Bundle;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public d(Lb/b/p/j/i;)V
    .registers 2

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lb/b/p/j/g;->h:Z

    .line 3
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public d(Z)V
    .registers 2

    .line 5
    iput-boolean p1, p0, Lb/b/p/j/g;->z:Z

    return-void
.end method

.method public e()Landroid/content/Context;
    .registers 2

    .line 17
    iget-object v0, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    return-object v0
.end method

.method public e(I)Lb/b/p/j/g;
    .registers 8

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    .line 18
    invoke-virtual/range {v0 .. v5}, Lb/b/p/j/g;->a(ILjava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V

    return-object p0
.end method

.method public e(Landroid/os/Bundle;)V
    .registers 9

    .line 1
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_44

    .line 2
    invoke-virtual {p0, v2}, Lb/b/p/j/g;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 3
    invoke-interface {v3}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_32

    .line 4
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_32

    if-nez v1, :cond_20

    .line 5
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 6
    :cond_20
    invoke-virtual {v4, v1}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 7
    invoke-interface {v3}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 8
    invoke-interface {v3}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    const-string v5, "android:menu:expandedactionview"

    invoke-virtual {p1, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 9
    :cond_32
    invoke-interface {v3}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 10
    invoke-interface {v3}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v3

    check-cast v3, Lb/b/p/j/r;

    .line 11
    invoke-virtual {v3, p1}, Lb/b/p/j/g;->e(Landroid/os/Bundle;)V

    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_44
    if-eqz v1, :cond_4d

    .line 12
    invoke-virtual {p0}, Lb/b/p/j/g;->d()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    :cond_4d
    return-void
.end method

.method public final e(Z)V
    .registers 4

    const/4 v0, 0x1

    if-eqz p1, :cond_1c

    .line 13
    iget-object p1, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    .line 14
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->keyboard:I

    if-eq p1, v0, :cond_1c

    iget-object p1, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    .line 15
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    iget-object v1, p0, Lb/b/p/j/g;->a:Landroid/content/Context;

    .line 16
    invoke-static {p1, v1}, Lb/h/m/z;->d(Landroid/view/ViewConfiguration;Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1c

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    iput-boolean v0, p0, Lb/b/p/j/g;->d:Z

    return-void
.end method

.method public f()Lb/b/p/j/i;
    .registers 2

    .line 5
    iget-object v0, p0, Lb/b/p/j/g;->x:Lb/b/p/j/i;

    return-object v0
.end method

.method public f(Landroid/os/Bundle;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->b(Landroid/os/Bundle;)V

    return-void
.end method

.method public findItem(I)Landroid/view/MenuItem;
    .registers 6

    .line 1
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_2a

    .line 2
    iget-object v2, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/i;

    .line 3
    invoke-virtual {v2}, Lb/b/p/j/i;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_16

    return-object v2

    .line 4
    :cond_16
    invoke-virtual {v2}, Lb/b/p/j/i;->hasSubMenu()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 5
    invoke-virtual {v2}, Lb/b/p/j/i;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v2

    invoke-interface {v2, p1}, Landroid/view/SubMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_27

    return-object v2

    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_2a
    const/4 p1, 0x0

    return-object p1
.end method

.method public g()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->o:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItem(I)Landroid/view/MenuItem;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/MenuItem;

    return-object p1
.end method

.method public h()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->n:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public hasVisibleItems()Z
    .registers 6

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->z:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    return v1

    .line 2
    :cond_6
    invoke-virtual {p0}, Lb/b/p/j/g;->size()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v0, :cond_20

    .line 3
    iget-object v4, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    .line 4
    invoke-virtual {v4}, Lb/b/p/j/i;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_1d

    return v1

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_20
    return v2
.end method

.method public i()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->p:Landroid/view/View;

    return-object v0
.end method

.method public isShortcutKey(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lb/b/p/j/g;->a(ILandroid/view/KeyEvent;)Lb/b/p/j/i;

    move-result-object p1

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method

.method public j()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lb/b/p/j/g;->b()V

    .line 2
    iget-object v0, p0, Lb/b/p/j/g;->j:Ljava/util/ArrayList;

    return-object v0
.end method

.method public k()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->t:Z

    return v0
.end method

.method public l()Landroid/content/res/Resources;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->b:Landroid/content/res/Resources;

    return-object v0
.end method

.method public m()Lb/b/p/j/g;
    .registers 1

    return-object p0
.end method

.method public n()Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/b/p/j/i;",
            ">;"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->h:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Lb/b/p/j/g;->g:Ljava/util/ArrayList;

    return-object v0

    .line 2
    :cond_7
    iget-object v0, p0, Lb/b/p/j/g;->g:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 3
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v0, :cond_2c

    .line 4
    iget-object v3, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/i;

    .line 5
    invoke-virtual {v3}, Lb/b/p/j/i;->isVisible()Z

    move-result v4

    if-eqz v4, :cond_29

    iget-object v4, p0, Lb/b/p/j/g;->g:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 6
    :cond_2c
    iput-boolean v1, p0, Lb/b/p/j/g;->h:Z

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lb/b/p/j/g;->k:Z

    .line 8
    iget-object v0, p0, Lb/b/p/j/g;->g:Ljava/util/ArrayList;

    return-object v0
.end method

.method public o()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->y:Z

    return v0
.end method

.method public p()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->c:Z

    return v0
.end method

.method public performIdentifierAction(II)Z
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;I)Z

    move-result p1

    return p1
.end method

.method public performShortcut(ILandroid/view/KeyEvent;I)Z
    .registers 4

    .line 1
    invoke-virtual {p0, p1, p2}, Lb/b/p/j/g;->a(ILandroid/view/KeyEvent;)Lb/b/p/j/i;

    move-result-object p1

    if-eqz p1, :cond_b

    .line 2
    invoke-virtual {p0, p1, p3}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;I)Z

    move-result p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    and-int/lit8 p2, p3, 0x2

    if-eqz p2, :cond_14

    const/4 p2, 0x1

    .line 3
    invoke-virtual {p0, p2}, Lb/b/p/j/g;->a(Z)V

    :cond_14
    return p1
.end method

.method public q()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->d:Z

    return v0
.end method

.method public r()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lb/b/p/j/g;->q:Z

    .line 2
    iget-boolean v1, p0, Lb/b/p/j/g;->r:Z

    if-eqz v1, :cond_e

    .line 3
    iput-boolean v0, p0, Lb/b/p/j/g;->r:Z

    .line 4
    iget-boolean v0, p0, Lb/b/p/j/g;->s:Z

    invoke-virtual {p0, v0}, Lb/b/p/j/g;->c(Z)V

    :cond_e
    return-void
.end method

.method public removeGroup(I)V
    .registers 7

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->a(I)I

    move-result v0

    if-ltz v0, :cond_2a

    .line 2
    iget-object v1, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_f
    add-int/lit8 v4, v3, 0x1

    if-ge v3, v1, :cond_26

    .line 3
    iget-object v3, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/b/p/j/i;

    invoke-virtual {v3}, Lb/b/p/j/i;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_26

    .line 4
    invoke-virtual {p0, v0, v2}, Lb/b/p/j/g;->a(IZ)V

    move v3, v4

    goto :goto_f

    :cond_26
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    :cond_2a
    return-void
.end method

.method public removeItem(I)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->b(I)I

    move-result p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lb/b/p/j/g;->a(IZ)V

    return-void
.end method

.method public s()V
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/g;->q:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/b/p/j/g;->q:Z

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lb/b/p/j/g;->r:Z

    .line 4
    iput-boolean v0, p0, Lb/b/p/j/g;->s:Z

    :cond_c
    return-void
.end method

.method public setGroupCheckable(IZZ)V
    .registers 8

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_20

    .line 2
    iget-object v2, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/i;

    .line 3
    invoke-virtual {v2}, Lb/b/p/j/i;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_1d

    .line 4
    invoke-virtual {v2, p3}, Lb/b/p/j/i;->c(Z)V

    .line 5
    invoke-virtual {v2, p2}, Lb/b/p/j/i;->setCheckable(Z)Landroid/view/MenuItem;

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_20
    return-void
.end method

.method public setGroupDividerEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/b/p/j/g;->y:Z

    return-void
.end method

.method public setGroupEnabled(IZ)V
    .registers 7

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1d

    .line 2
    iget-object v2, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/p/j/i;

    .line 3
    invoke-virtual {v2}, Lb/b/p/j/i;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_1a

    .line 4
    invoke-virtual {v2, p2}, Lb/b/p/j/i;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1d
    return-void
.end method

.method public setGroupVisible(IZ)V
    .registers 9

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    const/4 v3, 0x1

    if-ge v1, v0, :cond_23

    .line 2
    iget-object v4, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    .line 3
    invoke-virtual {v4}, Lb/b/p/j/i;->getGroupId()I

    move-result v5

    if-ne v5, p1, :cond_20

    .line 4
    invoke-virtual {v4, p2}, Lb/b/p/j/i;->e(Z)Z

    move-result v4

    if-eqz v4, :cond_20

    const/4 v2, 0x1

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_23
    if-eqz v2, :cond_28

    .line 5
    invoke-virtual {p0, v3}, Lb/b/p/j/g;->c(Z)V

    :cond_28
    return-void
.end method

.method public setQwertyMode(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/b/p/j/g;->c:Z

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method

.method public size()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/g;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
