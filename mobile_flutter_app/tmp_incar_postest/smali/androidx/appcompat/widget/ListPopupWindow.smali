.class public Landroidx/appcompat/widget/ListPopupWindow;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Lb/b/p/j/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/widget/ListPopupWindow$e;,
        Landroidx/appcompat/widget/ListPopupWindow$f;,
        Landroidx/appcompat/widget/ListPopupWindow$g;,
        Landroidx/appcompat/widget/ListPopupWindow$c;,
        Landroidx/appcompat/widget/ListPopupWindow$d;
    }
.end annotation


# static fields
.field public static M:Ljava/lang/reflect/Method;

.field public static N:Ljava/lang/reflect/Method;

.field public static O:Ljava/lang/reflect/Method;


# instance fields
.field public A:Landroid/graphics/drawable/Drawable;

.field public B:Landroid/widget/AdapterView$OnItemClickListener;

.field public C:Landroid/widget/AdapterView$OnItemSelectedListener;

.field public final D:Landroidx/appcompat/widget/ListPopupWindow$g;

.field public final E:Landroidx/appcompat/widget/ListPopupWindow$f;

.field public final F:Landroidx/appcompat/widget/ListPopupWindow$e;

.field public final G:Landroidx/appcompat/widget/ListPopupWindow$c;

.field public final H:Landroid/os/Handler;

.field public final I:Landroid/graphics/Rect;

.field public J:Landroid/graphics/Rect;

.field public K:Z

.field public L:Landroid/widget/PopupWindow;

.field public h:Landroid/content/Context;

.field public i:Landroid/widget/ListAdapter;

.field public j:Lb/b/q/r;

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:I

.field public t:Z

.field public u:Z

.field public v:I

.field public w:Landroid/view/View;

.field public x:I

.field public y:Landroid/database/DataSetObserver;

.field public z:Landroid/view/View;


# direct methods
.method public static constructor <clinit>()V
    .registers 7

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const-string v3, "ListPopupWindow"

    const/16 v4, 0x1c

    if-gt v0, v4, :cond_36

    .line 2
    :try_start_a
    const-class v0, Landroid/widget/PopupWindow;

    const-string v4, "setClipToScreenEnabled"

    new-array v5, v2, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroidx/appcompat/widget/ListPopupWindow;->M:Ljava/lang/reflect/Method;
    :try_end_1a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a .. :try_end_1a} :catch_1b

    goto :goto_20

    :catch_1b
    const-string v0, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well."

    .line 3
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    :goto_20
    :try_start_20
    const-class v0, Landroid/widget/PopupWindow;

    const-string v4, "setEpicenterBounds"

    new-array v5, v2, [Ljava/lang/Class;

    const-class v6, Landroid/graphics/Rect;

    aput-object v6, v5, v1

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroidx/appcompat/widget/ListPopupWindow;->O:Ljava/lang/reflect/Method;
    :try_end_30
    .catch Ljava/lang/NoSuchMethodException; {:try_start_20 .. :try_end_30} :catch_31

    goto :goto_36

    :catch_31
    const-string v0, "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well."

    .line 5
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_36
    :goto_36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-gt v0, v4, :cond_5c

    .line 7
    :try_start_3c
    const-class v0, Landroid/widget/PopupWindow;

    const-string v4, "getMaxAvailableHeight"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const-class v6, Landroid/view/View;

    aput-object v6, v5, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v5, v2

    const/4 v1, 0x2

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v2, v5, v1

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroidx/appcompat/widget/ListPopupWindow;->N:Ljava/lang/reflect/Method;
    :try_end_56
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3c .. :try_end_56} :catch_57

    goto :goto_5c

    :catch_57
    const-string v0, "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well."

    .line 8
    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5c
    :goto_5c
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    sget v0, Lb/b/a;->listPopupWindowStyle:I

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lb/b/a;->listPopupWindowStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/appcompat/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x2

    .line 5
    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->k:I

    .line 6
    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    const/16 v0, 0x3ea

    .line 7
    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->o:I

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->s:I

    .line 9
    iput-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->t:Z

    .line 10
    iput-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->u:Z

    const v1, 0x7fffffff

    .line 11
    iput v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->v:I

    .line 12
    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->x:I

    .line 13
    new-instance v1, Landroidx/appcompat/widget/ListPopupWindow$g;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/ListPopupWindow$g;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->D:Landroidx/appcompat/widget/ListPopupWindow$g;

    .line 14
    new-instance v1, Landroidx/appcompat/widget/ListPopupWindow$f;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/ListPopupWindow$f;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->E:Landroidx/appcompat/widget/ListPopupWindow$f;

    .line 15
    new-instance v1, Landroidx/appcompat/widget/ListPopupWindow$e;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/ListPopupWindow$e;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->F:Landroidx/appcompat/widget/ListPopupWindow$e;

    .line 16
    new-instance v1, Landroidx/appcompat/widget/ListPopupWindow$c;

    invoke-direct {v1, p0}, Landroidx/appcompat/widget/ListPopupWindow$c;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->G:Landroidx/appcompat/widget/ListPopupWindow$c;

    .line 17
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    .line 18
    iput-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->h:Landroid/content/Context;

    .line 19
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->H:Landroid/os/Handler;

    .line 20
    sget-object v1, Lb/b/j;->ListPopupWindow:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 21
    sget v2, Lb/b/j;->ListPopupWindow_android_dropDownHorizontalOffset:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->m:I

    .line 22
    sget v2, Lb/b/j;->ListPopupWindow_android_dropDownVerticalOffset:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    const/4 v2, 0x1

    if-eqz v0, :cond_65

    .line 23
    iput-boolean v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->p:Z

    .line 24
    :cond_65
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    new-instance v0, Landroidx/appcompat/widget/AppCompatPopupWindow;

    invoke-direct {v0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 13
    iget v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->m:I

    return v0
.end method

.method public final a(Landroid/view/View;IZ)I
    .registers 9

    .line 19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-gt v0, v1, :cond_39

    .line 20
    sget-object v0, Landroidx/appcompat/widget/ListPopupWindow;->N:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_32

    .line 21
    :try_start_a
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    .line 22
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    aput-object p3, v2, v3

    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_2a} :catch_2b

    return p1

    :catch_2b
    const-string p3, "ListPopupWindow"

    const-string v0, "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version."

    .line 24
    invoke-static {p3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    :cond_32
    iget-object p3, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {p3, p1, p2}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;I)I

    move-result p1

    return p1

    .line 26
    :cond_39
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;IZ)I

    move-result p1

    return p1
.end method

.method public a(Landroid/content/Context;Z)Lb/b/q/r;
    .registers 4

    .line 18
    new-instance v0, Lb/b/q/r;

    invoke-direct {v0, p1, p2}, Lb/b/q/r;-><init>(Landroid/content/Context;Z)V

    return-object v0
.end method

.method public a(I)V
    .registers 2

    .line 14
    iput p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->m:I

    return-void
.end method

.method public a(Landroid/graphics/Rect;)V
    .registers 3

    if-eqz p1, :cond_8

    .line 15
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    iput-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->J:Landroid/graphics/Rect;

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 11
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 2

    .line 12
    iput-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->z:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 2

    .line 16
    iput-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public a(Landroid/widget/ListAdapter;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->y:Landroid/database/DataSetObserver;

    if-nez v0, :cond_c

    .line 2
    new-instance v0, Landroidx/appcompat/widget/ListPopupWindow$d;

    invoke-direct {v0, p0}, Landroidx/appcompat/widget/ListPopupWindow$d;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    iput-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->y:Landroid/database/DataSetObserver;

    goto :goto_13

    .line 3
    :cond_c
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->i:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_13

    .line 4
    invoke-interface {v1, v0}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 5
    :cond_13
    :goto_13
    iput-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->i:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_1c

    .line 6
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->y:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 7
    :cond_1c
    iget-object p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    if-eqz p1, :cond_25

    .line 8
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->i:Landroid/widget/ListAdapter;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_25
    return-void
.end method

.method public a(Landroid/widget/PopupWindow$OnDismissListener;)V
    .registers 3

    .line 17
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 9
    iput-boolean p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->K:Z

    .line 10
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    return-void
.end method

.method public b(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->p:Z

    return-void
.end method

.method public b(Z)V
    .registers 3

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->r:Z

    .line 5
    iput-boolean p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->q:Z

    return-void
.end method

.method public b()Z
    .registers 2

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method public c()I
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->p:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    return v0
.end method

.method public final c(Z)V
    .registers 6

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_22

    .line 4
    sget-object v0, Landroidx/appcompat/widget/ListPopupWindow;->M:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_27

    .line 5
    :try_start_a
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_19} :catch_1a

    goto :goto_27

    :catch_1a
    const-string p1, "ListPopupWindow"

    const-string v0, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well."

    .line 6
    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_27

    .line 7
    :cond_22
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setIsClippedToScreen(Z)V

    :cond_27
    :goto_27
    return-void
.end method

.method public d()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public d(I)V
    .registers 3

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    return-void
.end method

.method public dismiss()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->q()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 4
    iput-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->H:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->D:Landroidx/appcompat/widget/ListPopupWindow$g;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public e(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 2
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v0, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v0

    add-int/2addr v1, p1

    iput v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    goto :goto_1b

    .line 4
    :cond_18
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ListPopupWindow;->j(I)V

    :goto_1b
    return-void
.end method

.method public f()Landroid/widget/ListView;
    .registers 2

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    return-object v0
.end method

.method public f(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->s:I

    return-void
.end method

.method public final g()I
    .registers 13

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    const/high16 v1, -0x80000000

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v0, :cond_bd

    .line 3
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->h:Landroid/content/Context;

    .line 4
    new-instance v5, Landroidx/appcompat/widget/ListPopupWindow$a;

    invoke-direct {v5, p0}, Landroidx/appcompat/widget/ListPopupWindow$a;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    .line 5
    iget-boolean v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->K:Z

    xor-int/2addr v5, v3

    invoke-virtual {p0, v0, v5}, Landroidx/appcompat/widget/ListPopupWindow;->a(Landroid/content/Context;Z)Lb/b/q/r;

    move-result-object v5

    iput-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    .line 6
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->A:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_20

    .line 7
    invoke-virtual {v5, v6}, Lb/b/q/r;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 8
    :cond_20
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->i:Landroid/widget/ListAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 9
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->B:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 10
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v5, v3}, Landroid/widget/ListView;->setFocusable(Z)V

    .line 11
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v5, v3}, Landroid/widget/ListView;->setFocusableInTouchMode(Z)V

    .line 12
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    new-instance v6, Landroidx/appcompat/widget/ListPopupWindow$b;

    invoke-direct {v6, p0}, Landroidx/appcompat/widget/ListPopupWindow$b;-><init>(Landroidx/appcompat/widget/ListPopupWindow;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 13
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->F:Landroidx/appcompat/widget/ListPopupWindow$e;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 14
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->C:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v5, :cond_52

    .line 15
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v6, v5}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 16
    :cond_52
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    .line 17
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->w:Landroid/view/View;

    if-eqz v6, :cond_b6

    .line 18
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 19
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 20
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 21
    iget v8, p0, Landroidx/appcompat/widget/ListPopupWindow;->x:I

    if-eqz v8, :cond_8d

    if-eq v8, v3, :cond_86

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid hint position "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->x:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v5, "ListPopupWindow"

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_93

    .line 23
    :cond_86
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_93

    .line 25
    :cond_8d
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 26
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    :goto_93
    iget v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    if-ltz v0, :cond_9a

    const/high16 v5, -0x80000000

    goto :goto_9c

    :cond_9a
    const/4 v0, 0x0

    const/4 v5, 0x0

    .line 28
    :goto_9c
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 29
    invoke-virtual {v6, v0, v4}, Landroid/view/View;->measure(II)V

    .line 30
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 31
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iget v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v5, v6

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v5, v0

    move v0, v5

    move-object v5, v7

    goto :goto_b7

    :cond_b6
    const/4 v0, 0x0

    .line 32
    :goto_b7
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v6, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    goto :goto_db

    .line 33
    :cond_bd
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 34
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->w:Landroid/view/View;

    if-eqz v0, :cond_da

    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iget v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v0, v6

    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v5

    goto :goto_db

    :cond_da
    const/4 v0, 0x0

    .line 37
    :goto_db
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_f7

    .line 38
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 39
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    iget v6, v5, Landroid/graphics/Rect;->top:I

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    .line 40
    iget-boolean v7, p0, Landroidx/appcompat/widget/ListPopupWindow;->p:Z

    if-nez v7, :cond_fd

    neg-int v6, v6

    .line 41
    iput v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    goto :goto_fd

    .line 42
    :cond_f7
    iget-object v5, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    const/4 v5, 0x0

    .line 43
    :cond_fd
    :goto_fd
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    .line 44
    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_107

    goto :goto_108

    :cond_107
    const/4 v3, 0x0

    .line 45
    :goto_108
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v4

    iget v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    invoke-virtual {p0, v4, v6, v3}, Landroidx/appcompat/widget/ListPopupWindow;->a(Landroid/view/View;IZ)I

    move-result v3

    .line 46
    iget-boolean v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->t:Z

    if-nez v4, :cond_179

    iget v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->k:I

    if-ne v4, v2, :cond_11b

    goto :goto_179

    .line 47
    :cond_11b
    iget v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    const/4 v6, -0x2

    if-eq v4, v6, :cond_142

    const/high16 v1, 0x40000000    # 2.0f

    if-eq v4, v2, :cond_129

    .line 48
    invoke-static {v4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_15a

    .line 49
    :cond_129
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->h:Landroid/content/Context;

    .line 50
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    iget v6, v4, Landroid/graphics/Rect;->left:I

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v6, v4

    sub-int/2addr v2, v6

    .line 51
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_15a

    .line 52
    :cond_142
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->h:Landroid/content/Context;

    .line 53
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->I:Landroid/graphics/Rect;

    iget v6, v4, Landroid/graphics/Rect;->left:I

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v6, v4

    sub-int/2addr v2, v6

    .line 54
    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    :goto_15a
    move v7, v1

    .line 55
    iget-object v6, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    const/4 v8, 0x0

    const/4 v9, -0x1

    sub-int v10, v3, v0

    const/4 v11, -0x1

    invoke-virtual/range {v6 .. v11}, Lb/b/q/r;->a(IIIII)I

    move-result v1

    if-lez v1, :cond_177

    .line 56
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v2}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    .line 57
    invoke-virtual {v3}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v5, v2

    add-int/2addr v0, v5

    :cond_177
    add-int/2addr v1, v0

    return v1

    :cond_179
    :goto_179
    add-int/2addr v3, v5

    return v3
.end method

.method public g(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method public h()V
    .registers 3

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    if-eqz v0, :cond_b

    const/4 v1, 0x1

    .line 3
    invoke-virtual {v0, v1}, Lb/b/q/r;->setListSelectionHidden(Z)V

    .line 4
    invoke-virtual {v0}, Landroid/widget/ListView;->requestLayout()V

    :cond_b
    return-void
.end method

.method public h(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->x:I

    return-void
.end method

.method public i()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->z:Landroid/view/View;

    return-object v0
.end method

.method public i(I)V
    .registers 4

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->b()Z

    move-result v1

    if-eqz v1, :cond_1b

    if-eqz v0, :cond_1b

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lb/b/q/r;->setListSelectionHidden(Z)V

    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setSelection(I)V

    .line 6
    invoke-virtual {v0}, Landroid/widget/ListView;->getChoiceMode()I

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, p1, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    :cond_1b
    return-void
.end method

.method public j()Ljava/lang/Object;
    .registers 2

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->b()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    .line 3
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public j(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    return-void
.end method

.method public k()J
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->b()Z

    move-result v0

    if-nez v0, :cond_9

    const-wide/high16 v0, -0x8000000000000000L

    return-wide v0

    .line 2
    :cond_9
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedItemId()J

    move-result-wide v0

    return-wide v0
.end method

.method public l()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->b()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, -0x1

    return v0

    .line 2
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedItemPosition()I

    move-result v0

    return v0
.end method

.method public m()Landroid/view/View;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->b()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_8
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0}, Landroid/widget/ListView;->getSelectedView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public n()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    return v0
.end method

.method public o()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public p()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->K:Z

    return v0
.end method

.method public final q()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->w:Landroid/view/View;

    if-eqz v0, :cond_13

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 3
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_13

    .line 4
    check-cast v0, Landroid/view/ViewGroup;

    .line 5
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->w:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_13
    return-void
.end method

.method public show()V
    .registers 14

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->g()I

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->o()Z

    move-result v1

    .line 3
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget v3, p0, Landroidx/appcompat/widget/ListPopupWindow;->o:I

    invoke-static {v2, v3}, Lb/h/n/h;->a(Landroid/widget/PopupWindow;I)V

    .line 4
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, -0x2

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-eqz v2, :cond_90

    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_26

    return-void

    .line 6
    :cond_26
    iget v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    if-ne v2, v6, :cond_2c

    const/4 v2, -0x1

    goto :goto_36

    :cond_2c
    if-ne v2, v4, :cond_36

    .line 7
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 8
    :cond_36
    :goto_36
    iget v7, p0, Landroidx/appcompat/widget/ListPopupWindow;->k:I

    if-ne v7, v6, :cond_64

    if-eqz v1, :cond_3d

    goto :goto_3e

    :cond_3d
    const/4 v0, -0x1

    :goto_3e
    if-eqz v1, :cond_52

    .line 9
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    if-ne v4, v6, :cond_48

    const/4 v4, -0x1

    goto :goto_49

    :cond_48
    const/4 v4, 0x0

    :goto_49
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 10
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_68

    .line 11
    :cond_52
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    if-ne v4, v6, :cond_5a

    const/4 v4, -0x1

    goto :goto_5b

    :cond_5a
    const/4 v4, 0x0

    :goto_5b
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 12
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_68

    :cond_64
    if-ne v7, v4, :cond_67

    goto :goto_68

    :cond_67
    move v0, v7

    .line 13
    :goto_68
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget-boolean v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->u:Z

    if-nez v4, :cond_73

    iget-boolean v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->t:Z

    if-nez v4, :cond_73

    goto :goto_74

    :cond_73
    const/4 v3, 0x0

    :goto_74
    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 14
    iget-object v7, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v8

    iget v9, p0, Landroidx/appcompat/widget/ListPopupWindow;->m:I

    iget v10, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    if-gez v2, :cond_85

    const/4 v11, -0x1

    goto :goto_86

    :cond_85
    move v11, v2

    :goto_86
    if-gez v0, :cond_8a

    const/4 v12, -0x1

    goto :goto_8b

    :cond_8a
    move v12, v0

    :goto_8b
    invoke-virtual/range {v7 .. v12}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    goto/16 :goto_12d

    .line 15
    :cond_90
    iget v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->l:I

    if-ne v1, v6, :cond_96

    const/4 v1, -0x1

    goto :goto_a0

    :cond_96
    if-ne v1, v4, :cond_a0

    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 17
    :cond_a0
    :goto_a0
    iget v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->k:I

    if-ne v2, v6, :cond_a6

    const/4 v0, -0x1

    goto :goto_aa

    :cond_a6
    if-ne v2, v4, :cond_a9

    goto :goto_aa

    :cond_a9
    move v0, v2

    .line 18
    :goto_aa
    iget-object v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 19
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 20
    invoke-virtual {p0, v3}, Landroidx/appcompat/widget/ListPopupWindow;->c(Z)V

    .line 21
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget-boolean v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->u:Z

    if-nez v1, :cond_c3

    iget-boolean v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->t:Z

    if-nez v1, :cond_c3

    const/4 v1, 0x1

    goto :goto_c4

    :cond_c3
    const/4 v1, 0x0

    :goto_c4
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 22
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->E:Landroidx/appcompat/widget/ListPopupWindow$f;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 23
    iget-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->r:Z

    if-eqz v0, :cond_d9

    .line 24
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget-boolean v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->q:Z

    invoke-static {v0, v1}, Lb/h/n/h;->a(Landroid/widget/PopupWindow;Z)V

    .line 25
    :cond_d9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_f8

    .line 26
    sget-object v0, Landroidx/appcompat/widget/ListPopupWindow;->O:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_ff

    .line 27
    :try_start_e3
    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Landroidx/appcompat/widget/ListPopupWindow;->J:Landroid/graphics/Rect;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_e3 .. :try_end_ee} :catch_ef

    goto :goto_ff

    :catch_ef
    move-exception v0

    const-string v1, "ListPopupWindow"

    const-string v2, "Could not invoke setEpicenterBounds on PopupWindow"

    .line 28
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_ff

    .line 29
    :cond_f8
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->J:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setEpicenterBounds(Landroid/graphics/Rect;)V

    .line 30
    :cond_ff
    :goto_ff
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->L:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->i()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Landroidx/appcompat/widget/ListPopupWindow;->m:I

    iget v3, p0, Landroidx/appcompat/widget/ListPopupWindow;->n:I

    iget v4, p0, Landroidx/appcompat/widget/ListPopupWindow;->s:I

    invoke-static {v0, v1, v2, v3, v4}, Lb/h/n/h;->a(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 31
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0, v6}, Landroid/widget/ListView;->setSelection(I)V

    .line 32
    iget-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->K:Z

    if-eqz v0, :cond_11f

    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->j:Lb/b/q/r;

    invoke-virtual {v0}, Lb/b/q/r;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_122

    .line 33
    :cond_11f
    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->h()V

    .line 34
    :cond_122
    iget-boolean v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->K:Z

    if-nez v0, :cond_12d

    .line 35
    iget-object v0, p0, Landroidx/appcompat/widget/ListPopupWindow;->H:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/appcompat/widget/ListPopupWindow;->G:Landroidx/appcompat/widget/ListPopupWindow$c;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_12d
    :goto_12d
    return-void
.end method
