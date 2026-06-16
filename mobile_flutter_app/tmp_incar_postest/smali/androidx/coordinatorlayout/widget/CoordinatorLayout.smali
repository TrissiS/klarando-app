.class public Landroidx/coordinatorlayout/widget/CoordinatorLayout;
.super Landroid/view/ViewGroup;
.source "CoordinatorLayout.java"

# interfaces
.implements Lb/h/m/o;
.implements Lb/h/m/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$d;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$g;,
        Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;
    }
.end annotation


# static fields
.field public static final B:Ljava/lang/String;

.field public static final C:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field public static final D:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Constructor<",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public static final E:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public static final F:Lb/h/l/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/h/l/e<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final A:Lb/h/m/r;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lb/g/d/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/g/d/a<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroid/graphics/Paint;

.field public final m:[I

.field public final n:[I

.field public o:Z

.field public p:Z

.field public q:[I

.field public r:Landroid/view/View;

.field public s:Landroid/view/View;

.field public t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

.field public u:Z

.field public v:Lb/h/m/g0;

.field public w:Z

.field public x:Landroid/graphics/drawable/Drawable;

.field public y:Landroid/view/ViewGroup$OnHierarchyChangeListener;

.field public z:Lb/h/m/s;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    const-class v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_e
    move-object v0, v1

    :goto_f
    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->B:Ljava/lang/String;

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1f

    .line 4
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$g;

    invoke-direct {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$g;-><init>()V

    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->E:Ljava/util/Comparator;

    goto :goto_21

    .line 5
    :cond_1f
    sput-object v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->E:Ljava/util/Comparator;

    :goto_21
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    .line 6
    const-class v2, Landroid/content/Context;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Landroid/util/AttributeSet;

    aput-object v2, v0, v1

    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->C:[Ljava/lang/Class;

    .line 7
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->D:Ljava/lang/ThreadLocal;

    .line 8
    new-instance v0, Lb/h/l/g;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lb/h/l/g;-><init>(I)V

    sput-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->F:Lb/h/l/e;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lb/g/a;->coordinatorLayoutStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 13

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    .line 5
    new-instance v0, Lb/g/d/a;

    invoke-direct {v0}, Lb/g/d/a;-><init>()V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j:Ljava/util/List;

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    const/4 v0, 0x2

    new-array v1, v0, [I

    .line 8
    iput-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    new-array v0, v0, [I

    .line 9
    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->n:[I

    .line 10
    new-instance v0, Lb/h/m/r;

    invoke-direct {v0, p0}, Lb/h/m/r;-><init>(Landroid/view/ViewGroup;)V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->A:Lb/h/m/r;

    const/4 v0, 0x0

    if-nez p3, :cond_3b

    .line 11
    sget-object v1, Lb/g/c;->CoordinatorLayout:[I

    sget v2, Lb/g/b;->Widget_Support_CoordinatorLayout:I

    .line 12
    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    goto :goto_41

    :cond_3b
    sget-object v1, Lb/g/c;->CoordinatorLayout:[I

    .line 13
    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 14
    :goto_41
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v2, v3, :cond_61

    if-nez p3, :cond_56

    .line 15
    sget-object v4, Lb/g/c;->CoordinatorLayout:[I

    const/4 v7, 0x0

    sget v8, Lb/g/b;->Widget_Support_CoordinatorLayout:I

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, v1

    invoke-virtual/range {v2 .. v8}, Landroid/view/ViewGroup;->saveAttributeDataForStyleable(Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    goto :goto_61

    .line 16
    :cond_56
    sget-object v4, Lb/g/c;->CoordinatorLayout:[I

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, v1

    move v7, p3

    invoke-virtual/range {v2 .. v8}, Landroid/view/ViewGroup;->saveAttributeDataForStyleable(Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 17
    :cond_61
    :goto_61
    sget p2, Lb/g/c;->CoordinatorLayout_keylines:I

    invoke-virtual {v1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_8b

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 19
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object p2

    iput-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:[I

    .line 20
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 21
    iget-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:[I

    array-length p2, p2

    :goto_7c
    if-ge v0, p2, :cond_8b

    .line 22
    iget-object p3, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:[I

    aget v2, p3, v0

    int-to-float v2, v2

    mul-float v2, v2, p1

    float-to-int v2, v2

    aput v2, p3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_7c

    .line 23
    :cond_8b
    sget p1, Lb/g/c;->CoordinatorLayout_statusBarBackground:I

    invoke-virtual {v1, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 24
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 25
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h()V

    .line 26
    new-instance p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$d;

    invoke-direct {p1, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$d;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    .line 27
    invoke-static {p0}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result p1

    if-nez p1, :cond_ab

    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Lb/h/m/y;->h(Landroid/view/View;I)V

    :cond_ab
    return-void
.end method

.method public static a(III)I
    .registers 3

    if-ge p0, p1, :cond_3

    return p1

    :cond_3
    if-le p0, p2, :cond_6

    return p2

    :cond_6
    return p0
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;Ljava/lang/String;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    .registers 8

    .line 47
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const-string v0, "."

    .line 48
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_49

    :cond_24
    const/16 v0, 0x2e

    .line 50
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_2d

    goto :goto_49

    .line 51
    :cond_2d
    sget-object v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->B:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_49

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->B:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 52
    :cond_49
    :goto_49
    :try_start_49
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->D:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_5d

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 54
    sget-object v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->D:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 55
    :cond_5d
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Constructor;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_7b

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p2, v3, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 57
    sget-object v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->C:[Ljava/lang/Class;

    invoke-virtual {v1, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 59
    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7b
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    aput-object p1, v0, v2

    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_88} :catch_89

    return-object p0

    :catch_89
    move-exception p0

    .line 61
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not inflate Behavior subclass "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static a(Landroid/graphics/Rect;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Rect;->setEmpty()V

    .line 2
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->F:Lb/h/l/e;

    invoke-interface {v0, p0}, Lb/h/l/e;->a(Ljava/lang/Object;)Z

    return-void
.end method

.method public static c(I)I
    .registers 1

    if-nez p0, :cond_4

    const/16 p0, 0x11

    :cond_4
    return p0
.end method

.method public static d(I)I
    .registers 2

    and-int/lit8 v0, p0, 0x7

    if-nez v0, :cond_8

    const v0, 0x800003

    or-int/2addr p0, v0

    :cond_8
    and-int/lit8 v0, p0, 0x70

    if-nez v0, :cond_e

    or-int/lit8 p0, p0, 0x30

    :cond_e
    return p0
.end method

.method public static e(I)I
    .registers 1

    if-nez p0, :cond_5

    const p0, 0x800035

    :cond_5
    return p0
.end method

.method public static i()Landroid/graphics/Rect;
    .registers 1

    .line 1
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->F:Lb/h/l/e;

    invoke-interface {v0}, Lb/h/l/e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    if-nez v0, :cond_f

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    :cond_f
    return-object v0
.end method


# virtual methods
.method public final a(I)I
    .registers 6

    .line 42
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->q:[I

    const/4 v1, 0x0

    const-string v2, "CoordinatorLayout"

    if-nez v0, :cond_24

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No keylines defined for "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " - attempted index lookup "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_24
    if-ltz p1, :cond_2d

    .line 44
    array-length v3, v0

    if-lt p1, v3, :cond_2a

    goto :goto_2d

    .line 45
    :cond_2a
    aget p1, v0, p1

    return p1

    .line 46
    :cond_2d
    :goto_2d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Keyline index "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " out of range for "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public final a(Lb/h/m/g0;)Lb/h/m/g0;
    .registers 6

    .line 64
    invoke-virtual {p1}, Lb/h/m/g0;->j()Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p1

    :cond_7
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_c
    if-ge v0, v1, :cond_31

    .line 66
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 67
    invoke-static {v2}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 68
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 69
    invoke-virtual {v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v3

    if-eqz v3, :cond_2e

    .line 70
    invoke-virtual {v3, p0, v2, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;

    .line 71
    invoke-virtual {p1}, Lb/h/m/g0;->j()Z

    move-result v2

    if-eqz v2, :cond_2e

    goto :goto_31

    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_31
    :goto_31
    return-object p1
.end method

.method public a(Landroid/view/View;)V
    .registers 6

    .line 149
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v0, p1}, Lb/g/d/a;->c(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2d

    .line 150
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2d

    const/4 v1, 0x0

    .line 151
    :goto_f
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2d

    .line 152
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 153
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 154
    invoke-virtual {v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v3

    if-eqz v3, :cond_2a

    .line 155
    invoke-virtual {v3, p0, v2, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_2d
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 8

    .line 169
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->A:Lb/h/m/r;

    invoke-virtual {v0, p1, p2}, Lb/h/m/r;->a(Landroid/view/View;I)V

    .line 170
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_2f

    .line 171
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 172
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 173
    invoke-virtual {v3, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v4

    if-nez v4, :cond_1d

    goto :goto_2c

    .line 174
    :cond_1d
    invoke-virtual {v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    if-eqz v4, :cond_26

    .line 175
    invoke-virtual {v4, p0, v2, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;I)V

    .line 176
    :cond_26
    invoke-virtual {v3, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b(I)V

    .line 177
    invoke-virtual {v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->g()V

    :goto_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_2f
    const/4 p1, 0x0

    .line 178
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/view/View;IIII)V
    .registers 6

    .line 63
    invoke-virtual/range {p0 .. p5}, Landroid/view/ViewGroup;->measureChildWithMargins(Landroid/view/View;IIII)V

    return-void
.end method

.method public a(Landroid/view/View;IIIII)V
    .registers 15

    .line 179
    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->n:[I

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;IIIII[I)V

    return-void
.end method

.method public a(Landroid/view/View;IIIII[I)V
    .registers 25

    move-object/from16 v10, p0

    .line 180
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v11

    const/4 v12, 0x0

    const/4 v0, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_b
    const/4 v9, 0x1

    if-ge v13, v11, :cond_78

    .line 181
    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 182
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v3, 0x8

    if-ne v1, v3, :cond_1b

    goto :goto_75

    .line 183
    :cond_1b
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move/from16 v8, p6

    .line 184
    invoke-virtual {v1, v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v3

    if-nez v3, :cond_2a

    goto :goto_75

    .line 185
    :cond_2a
    invoke-virtual {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    if-eqz v1, :cond_75

    .line 186
    iget-object v7, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    aput v12, v7, v12

    .line 187
    aput v12, v7, v9

    move-object v0, v1

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v16, v7

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, v16

    .line 188
    invoke-virtual/range {v0 .. v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIIII[I)V

    .line 189
    iget-object v0, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    if-lez p4, :cond_57

    aget v0, v0, v12

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_5d

    :cond_57
    aget v0, v0, v12

    .line 190
    invoke-static {v14, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_5d
    move v14, v0

    if-lez p5, :cond_6a

    .line 191
    iget-object v0, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_73

    :cond_6a
    const/4 v1, 0x1

    iget-object v0, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    aget v0, v0, v1

    .line 192
    invoke-static {v15, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_73
    move v15, v0

    const/4 v0, 0x1

    :cond_75
    :goto_75
    add-int/lit8 v13, v13, 0x1

    goto :goto_b

    :cond_78
    const/4 v1, 0x1

    .line 193
    aget v2, p7, v12

    add-int/2addr v2, v14

    aput v2, p7, v12

    .line 194
    aget v2, p7, v1

    add-int/2addr v2, v15

    aput v2, p7, v1

    if-eqz v0, :cond_88

    .line 195
    invoke-virtual {v10, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(I)V

    :cond_88
    return-void
.end method

.method public a(Landroid/view/View;II[II)V
    .registers 22

    move-object/from16 v8, p0

    .line 196
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    const/4 v10, 0x0

    const/4 v0, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_b
    const/4 v14, 0x1

    if-ge v11, v9, :cond_6e

    .line 197
    invoke-virtual {v8, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 198
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v3, 0x8

    if-ne v1, v3, :cond_1d

    move/from16 v15, p5

    goto :goto_6b

    .line 199
    :cond_1d
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move/from16 v15, p5

    .line 200
    invoke-virtual {v1, v15}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v3

    if-nez v3, :cond_2c

    goto :goto_6b

    .line 201
    :cond_2c
    invoke-virtual {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    if-eqz v1, :cond_6b

    .line 202
    iget-object v6, v8, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    aput v10, v6, v10

    .line 203
    aput v10, v6, v14

    move-object v0, v1

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p5

    .line 204
    invoke-virtual/range {v0 .. v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V

    .line 205
    iget-object v0, v8, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    if-lez p2, :cond_51

    aget v0, v0, v10

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_57

    :cond_51
    aget v0, v0, v10

    .line 206
    invoke-static {v12, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_57
    move v12, v0

    .line 207
    iget-object v0, v8, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->m:[I

    if-lez p3, :cond_63

    aget v0, v0, v14

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_69

    :cond_63
    aget v0, v0, v14

    .line 208
    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_69
    move v13, v0

    const/4 v0, 0x1

    :cond_6b
    :goto_6b
    add-int/lit8 v11, v11, 0x1

    goto :goto_b

    .line 209
    :cond_6e
    aput v12, p4, v10

    .line 210
    aput v13, p4, v14

    if-eqz v0, :cond_77

    .line 211
    invoke-virtual {v8, v14}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(I)V

    :cond_77
    return-void
.end method

.method public a(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 16

    .line 102
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 103
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    .line 104
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, v0

    move v7, v9

    move v8, v10

    .line 105
    invoke-virtual/range {v1 .. v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;II)V

    .line 106
    invoke-virtual {p0, v0, p4, v9, v10}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;Landroid/graphics/Rect;II)V

    return-void
.end method

.method public final a(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;II)V
    .registers 13

    .line 76
    iget p1, p5, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->c:I

    .line 77
    invoke-static {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(I)I

    move-result p1

    .line 78
    invoke-static {p1, p2}, Lb/h/m/e;->a(II)I

    move-result p1

    .line 79
    iget p5, p5, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d:I

    .line 80
    invoke-static {p5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(I)I

    move-result p5

    .line 81
    invoke-static {p5, p2}, Lb/h/m/e;->a(II)I

    move-result p2

    and-int/lit8 p5, p1, 0x7

    and-int/lit8 p1, p1, 0x70

    and-int/lit8 v0, p2, 0x7

    and-int/lit8 p2, p2, 0x70

    const/4 v1, 0x5

    const/4 v2, 0x1

    if-eq v0, v2, :cond_28

    if-eq v0, v1, :cond_25

    .line 82
    iget v0, p3, Landroid/graphics/Rect;->left:I

    goto :goto_31

    .line 83
    :cond_25
    iget v0, p3, Landroid/graphics/Rect;->right:I

    goto :goto_31

    .line 84
    :cond_28
    iget v0, p3, Landroid/graphics/Rect;->left:I

    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v0, v3

    :goto_31
    const/16 v3, 0x50

    const/16 v4, 0x10

    if-eq p2, v4, :cond_3f

    if-eq p2, v3, :cond_3c

    .line 85
    iget p2, p3, Landroid/graphics/Rect;->top:I

    goto :goto_48

    .line 86
    :cond_3c
    iget p2, p3, Landroid/graphics/Rect;->bottom:I

    goto :goto_48

    .line 87
    :cond_3f
    iget p2, p3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    add-int/2addr p2, p3

    :goto_48
    if-eq p5, v2, :cond_4e

    if-eq p5, v1, :cond_51

    sub-int/2addr v0, p6

    goto :goto_51

    .line 88
    :cond_4e
    div-int/lit8 p3, p6, 0x2

    sub-int/2addr v0, p3

    :cond_51
    :goto_51
    if-eq p1, v4, :cond_57

    if-eq p1, v3, :cond_5a

    sub-int/2addr p2, p7

    goto :goto_5a

    .line 89
    :cond_57
    div-int/lit8 p1, p7, 0x2

    sub-int/2addr p2, p1

    :cond_5a
    :goto_5a
    add-int/2addr p6, v0

    add-int/2addr p7, p2

    .line 90
    invoke-virtual {p4, v0, p2, p6, p7}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public a(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 3

    .line 62
    invoke-static {p0, p1, p2}, Lb/g/d/b;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    return-void
.end method

.method public final a(Landroid/view/View;Landroid/graphics/Rect;I)V
    .registers 12

    .line 117
    invoke-static {p1}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 118
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_fd

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_15

    goto/16 :goto_fd

    .line 119
    :cond_15
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 120
    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    .line 121
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v2

    .line 122
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v3

    .line 123
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v5

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v6

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    if-eqz v1, :cond_70

    .line 124
    invoke-virtual {v1, p0, p1, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_70

    .line 125
    invoke-virtual {v3, v2}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_49

    goto :goto_73

    .line 126
    :cond_49
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Rect should be within the child\'s bounds. Rect:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    invoke-virtual {v2}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " | Bounds:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    invoke-virtual {v3}, Landroid/graphics/Rect;->toShortString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 129
    :cond_70
    invoke-virtual {v2, v3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 130
    :goto_73
    invoke-static {v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 131
    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_80

    .line 132
    invoke-static {v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return-void

    .line 133
    :cond_80
    iget v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->h:I

    invoke-static {v1, p3}, Lb/h/m/e;->a(II)I

    move-result p3

    and-int/lit8 v1, p3, 0x30

    const/16 v3, 0x30

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v1, v3, :cond_a0

    .line 134
    iget v1, v2, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v1, v3

    iget v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->j:I

    sub-int/2addr v1, v3

    .line 135
    iget v3, p2, Landroid/graphics/Rect;->top:I

    if-ge v1, v3, :cond_a0

    sub-int/2addr v3, v1

    .line 136
    invoke-virtual {p0, p1, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;I)V

    const/4 v1, 0x1

    goto :goto_a1

    :cond_a0
    const/4 v1, 0x0

    :goto_a1
    and-int/lit8 v3, p3, 0x50

    const/16 v6, 0x50

    if-ne v3, v6, :cond_bd

    .line 137
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    iget v6, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v6

    iget v6, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v3, v6

    iget v6, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->j:I

    add-int/2addr v3, v6

    .line 138
    iget v6, p2, Landroid/graphics/Rect;->bottom:I

    if-ge v3, v6, :cond_bd

    sub-int/2addr v3, v6

    .line 139
    invoke-virtual {p0, p1, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;I)V

    const/4 v1, 0x1

    :cond_bd
    if-nez v1, :cond_c2

    .line 140
    invoke-virtual {p0, p1, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;I)V

    :cond_c2
    and-int/lit8 v1, p3, 0x3

    const/4 v3, 0x3

    if-ne v1, v3, :cond_d9

    .line 141
    iget v1, v2, Landroid/graphics/Rect;->left:I

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v1, v3

    iget v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->i:I

    sub-int/2addr v1, v3

    .line 142
    iget v3, p2, Landroid/graphics/Rect;->left:I

    if-ge v1, v3, :cond_d9

    sub-int/2addr v3, v1

    .line 143
    invoke-virtual {p0, p1, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(Landroid/view/View;I)V

    const/4 v1, 0x1

    goto :goto_da

    :cond_d9
    const/4 v1, 0x0

    :goto_da
    const/4 v3, 0x5

    and-int/2addr p3, v3

    if-ne p3, v3, :cond_f4

    .line 144
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result p3

    iget v3, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr p3, v3

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr p3, v3

    iget v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->i:I

    add-int/2addr p3, v0

    .line 145
    iget p2, p2, Landroid/graphics/Rect;->right:I

    if-ge p3, p2, :cond_f4

    sub-int/2addr p3, p2

    .line 146
    invoke-virtual {p0, p1, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(Landroid/view/View;I)V

    goto :goto_f5

    :cond_f4
    move v4, v1

    :goto_f5
    if-nez v4, :cond_fa

    .line 147
    invoke-virtual {p0, p1, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(Landroid/view/View;I)V

    .line 148
    :cond_fa
    invoke-static {v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    :cond_fd
    :goto_fd
    return-void
.end method

.method public final a(Landroid/view/View;Landroid/view/View;I)V
    .registers 8

    .line 107
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v0

    .line 108
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v1

    .line 109
    :try_start_8
    invoke-virtual {p0, p2, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 110
    invoke-virtual {p0, p1, p3, v0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 111
    iget p2, v1, Landroid/graphics/Rect;->left:I

    iget p3, v1, Landroid/graphics/Rect;->top:I

    iget v2, v1, Landroid/graphics/Rect;->right:I

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, p2, p3, v2, v3}, Landroid/view/View;->layout(IIII)V
    :try_end_19
    .catchall {:try_start_8 .. :try_end_19} :catchall_20

    .line 112
    invoke-static {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 113
    invoke-static {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return-void

    :catchall_20
    move-exception p1

    .line 114
    invoke-static {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 115
    invoke-static {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 116
    throw p1
.end method

.method public a(Landroid/view/View;Landroid/view/View;II)V
    .registers 14

    .line 161
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->A:Lb/h/m/r;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/h/m/r;->a(Landroid/view/View;Landroid/view/View;II)V

    .line 162
    iput-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s:Landroid/view/View;

    .line 163
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_c
    if-ge v1, v0, :cond_30

    .line 164
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 165
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 166
    invoke-virtual {v2, p4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v3

    if-nez v3, :cond_1f

    goto :goto_2d

    .line 167
    :cond_1f
    invoke-virtual {v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v2

    if-eqz v2, :cond_2d

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    move v8, p4

    .line 168
    invoke-virtual/range {v2 .. v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)V

    :cond_2d
    :goto_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_30
    return-void
.end method

.method public a(Landroid/view/View;ZLandroid/graphics/Rect;)V
    .registers 6

    .line 72
    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_f

    goto :goto_29

    :cond_f
    if-eqz p2, :cond_15

    .line 73
    invoke-virtual {p0, p1, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    goto :goto_28

    .line 74
    :cond_15
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    invoke-virtual {p3, p2, v0, v1, p1}, Landroid/graphics/Rect;->set(IIII)V

    :goto_28
    return-void

    .line 75
    :cond_29
    :goto_29
    invoke-virtual {p3}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method

.method public final a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;Landroid/graphics/Rect;II)V
    .registers 10

    .line 91
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    .line 92
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    .line 93
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v2, v3

    iget v3, p2, Landroid/graphics/Rect;->left:I

    .line 94
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v4

    sub-int/2addr v0, v4

    sub-int/2addr v0, p3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v0, v4

    .line 95
    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 96
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 97
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    iget v3, p2, Landroid/graphics/Rect;->top:I

    .line 98
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v1, v4

    sub-int/2addr v1, p4

    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v1, p1

    .line 99
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 100
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    add-int/2addr p3, v0

    add-int/2addr p4, p1

    .line 101
    invoke-virtual {p2, v0, p1, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final a(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->isChildrenDrawingOrderEnabled()Z

    move-result v0

    .line 19
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v2, v1, -0x1

    :goto_d
    if-ltz v2, :cond_21

    if-eqz v0, :cond_16

    .line 20
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->getChildDrawingOrder(II)I

    move-result v3

    goto :goto_17

    :cond_16
    move v3, v2

    .line 21
    :goto_17
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 22
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, -0x1

    goto :goto_d

    .line 23
    :cond_21
    sget-object v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->E:Ljava/util/Comparator;

    if-eqz v0, :cond_28

    .line 24
    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_28
    return-void
.end method

.method public final a(Z)V
    .registers 15

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_34

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 5
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 6
    invoke-virtual {v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    if-eqz v4, :cond_31

    .line 7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-wide v5, v7

    .line 8
    invoke-static/range {v5 .. v12}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v5

    if-eqz p1, :cond_2b

    .line 9
    invoke-virtual {v4, p0, v3, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_2e

    .line 10
    :cond_2b
    invoke-virtual {v4, p0, v3, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 11
    :goto_2e
    invoke-virtual {v5}, Landroid/view/MotionEvent;->recycle()V

    :cond_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_34
    const/4 p1, 0x0

    :goto_35
    if-ge p1, v0, :cond_47

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 13
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 14
    invoke-virtual {v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->h()V

    add-int/lit8 p1, p1, 0x1

    goto :goto_35

    :cond_47
    const/4 p1, 0x0

    .line 15
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    .line 16
    iput-boolean v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Z

    return-void
.end method

.method public final a(Landroid/view/MotionEvent;I)Z
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 25
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    .line 26
    iget-object v4, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->j:Ljava/util/List;

    .line 27
    invoke-virtual {v0, v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Ljava/util/List;)V

    .line 28
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_18
    if-ge v8, v5, :cond_81

    .line 29
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/view/View;

    .line 30
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 31
    invoke-virtual {v12}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v13

    const/4 v14, 0x1

    if-nez v9, :cond_2f

    if-eqz v10, :cond_54

    :cond_2f
    if-eqz v3, :cond_54

    if-eqz v13, :cond_7e

    if-nez v7, :cond_47

    .line 32
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v17

    const/16 v19, 0x3

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-wide/from16 v15, v17

    .line 33
    invoke-static/range {v15 .. v22}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v7

    :cond_47
    if-eqz v2, :cond_50

    if-eq v2, v14, :cond_4c

    goto :goto_7e

    .line 34
    :cond_4c
    invoke-virtual {v13, v0, v11, v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_7e

    .line 35
    :cond_50
    invoke-virtual {v13, v0, v11, v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_7e

    :cond_54
    if-nez v9, :cond_6a

    if-eqz v13, :cond_6a

    if-eqz v2, :cond_62

    if-eq v2, v14, :cond_5d

    goto :goto_66

    .line 36
    :cond_5d
    invoke-virtual {v13, v0, v11, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v9

    goto :goto_66

    .line 37
    :cond_62
    invoke-virtual {v13, v0, v11, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v9

    :goto_66
    if-eqz v9, :cond_6a

    .line 38
    iput-object v11, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    .line 39
    :cond_6a
    invoke-virtual {v12}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b()Z

    move-result v10

    .line 40
    invoke-virtual {v12, v0, v11}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Z

    move-result v11

    if-eqz v11, :cond_78

    if-nez v10, :cond_78

    const/4 v10, 0x1

    goto :goto_79

    :cond_78
    const/4 v10, 0x0

    :goto_79
    if-eqz v11, :cond_7e

    if-nez v10, :cond_7e

    goto :goto_81

    :cond_7e
    :goto_7e
    add-int/lit8 v8, v8, 0x1

    goto :goto_18

    .line 41
    :cond_81
    :goto_81
    invoke-interface {v4}, Ljava/util/List;->clear()V

    return v9
.end method

.method public a(Landroid/view/View;II)Z
    .registers 5

    .line 156
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v0

    .line 157
    invoke-virtual {p0, p1, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 158
    :try_start_7
    invoke-virtual {v0, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1
    :try_end_b
    .catchall {:try_start_7 .. :try_end_b} :catchall_f

    .line 159
    invoke-static {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return p1

    :catchall_f
    move-exception p1

    invoke-static {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 160
    throw p1
.end method

.method public final b(Lb/h/m/g0;)Lb/h/m/g0;
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-static {v0, p1}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 2
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_16

    .line 3
    invoke-virtual {p1}, Lb/h/m/g0;->h()I

    move-result v2

    if-lez v2, :cond_16

    const/4 v2, 0x1

    goto :goto_17

    :cond_16
    const/4 v2, 0x0

    :goto_17
    iput-boolean v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Z

    if-nez v2, :cond_22

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_22

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :goto_23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    .line 5
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Lb/h/m/g0;)Lb/h/m/g0;

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_2c
    return-object p1
.end method

.method public b(Landroid/view/View;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v0, p1}, Lb/g/d/a;->d(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 85
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_12

    .line 86
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 87
    :cond_12
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    return-object p1
.end method

.method public final b(I)V
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 49
    invoke-static/range {p0 .. p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v2

    .line 50
    iget-object v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .line 51
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v4

    .line 52
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v5

    .line 53
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_1c
    if-ge v8, v3, :cond_107

    .line 54
    iget-object v9, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 55
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    if-nez v1, :cond_38

    .line 56
    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v11

    const/16 v12, 0x8

    if-ne v11, v12, :cond_38

    goto/16 :goto_103

    :cond_38
    const/4 v11, 0x0

    :goto_39
    if-ge v11, v8, :cond_4d

    .line 57
    iget-object v12, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/view/View;

    .line 58
    iget-object v13, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->l:Landroid/view/View;

    if-ne v13, v12, :cond_4a

    .line 59
    invoke-virtual {v0, v9, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(Landroid/view/View;I)V

    :cond_4a
    add-int/lit8 v11, v11, 0x1

    goto :goto_39

    :cond_4d
    const/4 v11, 0x1

    .line 60
    invoke-virtual {v0, v9, v11, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 61
    iget v12, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->g:I

    if-eqz v12, :cond_a9

    invoke-virtual {v5}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_a9

    .line 62
    iget v12, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->g:I

    invoke-static {v12, v2}, Lb/h/m/e;->a(II)I

    move-result v12

    and-int/lit8 v13, v12, 0x70

    const/16 v14, 0x30

    if-eq v13, v14, :cond_7c

    const/16 v14, 0x50

    if-eq v13, v14, :cond_6c

    goto :goto_86

    .line 63
    :cond_6c
    iget v13, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v14

    iget v15, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v14, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    iput v13, v4, Landroid/graphics/Rect;->bottom:I

    goto :goto_86

    .line 64
    :cond_7c
    iget v13, v4, Landroid/graphics/Rect;->top:I

    iget v14, v5, Landroid/graphics/Rect;->bottom:I

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v13

    iput v13, v4, Landroid/graphics/Rect;->top:I

    :goto_86
    and-int/lit8 v12, v12, 0x7

    const/4 v13, 0x3

    if-eq v12, v13, :cond_9f

    const/4 v13, 0x5

    if-eq v12, v13, :cond_8f

    goto :goto_a9

    .line 65
    :cond_8f
    iget v12, v4, Landroid/graphics/Rect;->right:I

    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v13

    iget v14, v5, Landroid/graphics/Rect;->left:I

    sub-int/2addr v13, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    iput v12, v4, Landroid/graphics/Rect;->right:I

    goto :goto_a9

    .line 66
    :cond_9f
    iget v12, v4, Landroid/graphics/Rect;->left:I

    iget v13, v5, Landroid/graphics/Rect;->right:I

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v12

    iput v12, v4, Landroid/graphics/Rect;->left:I

    .line 67
    :cond_a9
    :goto_a9
    iget v10, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->h:I

    if-eqz v10, :cond_b6

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-nez v10, :cond_b6

    .line 68
    invoke-virtual {v0, v9, v4, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/graphics/Rect;I)V

    :cond_b6
    const/4 v10, 0x2

    if-eq v1, v10, :cond_c6

    .line 69
    invoke-virtual {v0, v9, v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 70
    invoke-virtual {v6, v5}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c3

    goto :goto_103

    .line 71
    :cond_c3
    invoke-virtual {v0, v9, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->c(Landroid/view/View;Landroid/graphics/Rect;)V

    :cond_c6
    add-int/lit8 v12, v8, 0x1

    :goto_c8
    if-ge v12, v3, :cond_103

    .line 72
    iget-object v13, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/View;

    .line 73
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 74
    invoke-virtual {v14}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v15

    if-eqz v15, :cond_100

    .line 75
    invoke-virtual {v15, v0, v13, v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v16

    if-eqz v16, :cond_100

    if-nez v1, :cond_f0

    .line 76
    invoke-virtual {v14}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->e()Z

    move-result v16

    if-eqz v16, :cond_f0

    .line 77
    invoke-virtual {v14}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->g()V

    goto :goto_100

    :cond_f0
    if-eq v1, v10, :cond_f7

    .line 78
    invoke-virtual {v15, v0, v13, v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v13

    goto :goto_fb

    .line 79
    :cond_f7
    invoke-virtual {v15, v0, v13, v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V

    const/4 v13, 0x1

    :goto_fb
    if-ne v1, v11, :cond_100

    .line 80
    invoke-virtual {v14, v13}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Z)V

    :cond_100
    :goto_100
    add-int/lit8 v12, v12, 0x1

    goto :goto_c8

    :cond_103
    :goto_103
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1c

    .line 81
    :cond_107
    invoke-static {v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 82
    invoke-static {v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 83
    invoke-static {v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final b(Landroid/view/View;I)V
    .registers 12

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 30
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v7

    .line 31
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    .line 33
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v4, v5

    .line 35
    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 36
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    if-eqz v1, :cond_6f

    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 37
    invoke-static {p1}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_6f

    .line 38
    iget v1, v7, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v2}, Lb/h/m/g0;->f()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->left:I

    .line 39
    iget v1, v7, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v2}, Lb/h/m/g0;->h()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->top:I

    .line 40
    iget v1, v7, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v2}, Lb/h/m/g0;->g()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->right:I

    .line 41
    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v2}, Lb/h/m/g0;->e()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->bottom:I

    .line 42
    :cond_6f
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v8

    .line 43
    iget v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->c:I

    invoke-static {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(I)I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    move-object v4, v7

    move-object v5, v8

    move v6, p2

    .line 45
    invoke-static/range {v1 .. v6}, Lb/h/m/e;->a(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 46
    iget p2, v8, Landroid/graphics/Rect;->left:I

    iget v0, v8, Landroid/graphics/Rect;->top:I

    iget v1, v8, Landroid/graphics/Rect;->right:I

    iget v2, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 47
    invoke-static {v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 48
    invoke-static {v8}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final b(Landroid/view/View;II)V
    .registers 12

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 10
    iget v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->c:I

    .line 11
    invoke-static {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(I)I

    move-result v1

    .line 12
    invoke-static {v1, p3}, Lb/h/m/e;->a(II)I

    move-result v1

    and-int/lit8 v2, v1, 0x7

    and-int/lit8 v1, v1, 0x70

    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v4

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    const/4 v7, 0x1

    if-ne p3, v7, :cond_29

    sub-int p2, v3, p2

    .line 17
    :cond_29
    invoke-virtual {p0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(I)I

    move-result p2

    sub-int/2addr p2, v5

    const/4 p3, 0x0

    if-eq v2, v7, :cond_37

    const/4 v7, 0x5

    if-eq v2, v7, :cond_35

    goto :goto_3a

    :cond_35
    add-int/2addr p2, v5

    goto :goto_3a

    .line 18
    :cond_37
    div-int/lit8 v2, v5, 0x2

    add-int/2addr p2, v2

    :goto_3a
    const/16 v2, 0x10

    if-eq v1, v2, :cond_46

    const/16 v2, 0x50

    if-eq v1, v2, :cond_43

    goto :goto_49

    :cond_43
    add-int/lit8 p3, v6, 0x0

    goto :goto_49

    .line 19
    :cond_46
    div-int/lit8 v1, v6, 0x2

    add-int/2addr p3, v1

    .line 20
    :goto_49
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v1, v2

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    sub-int/2addr v3, v2

    sub-int/2addr v3, v5

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v2

    .line 22
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 23
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    iget v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v1, v2

    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v4, v2

    sub-int/2addr v4, v6

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v4, v0

    .line 26
    invoke-static {p3, v4}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 27
    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    add-int/2addr v5, p2

    add-int/2addr v6, p3

    .line 28
    invoke-virtual {p1, p2, p3, v5, v6}, Landroid/view/View;->layout(IIII)V

    return-void
.end method

.method public b(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 3

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 8
    invoke-virtual {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->f()Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/View;II)Z
    .registers 19

    move/from16 v7, p4

    .line 88
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_9
    if-ge v10, v8, :cond_3d

    move-object v12, p0

    .line 89
    invoke-virtual {p0, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 90
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_19

    goto :goto_3a

    .line 91
    :cond_19
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 92
    invoke-virtual {v13}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    if-eqz v0, :cond_37

    move-object v1, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    .line 93
    invoke-virtual/range {v0 .. v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z

    move-result v0

    or-int/2addr v11, v0

    .line 94
    invoke-virtual {v13, v7, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(IZ)V

    goto :goto_3a

    .line 95
    :cond_37
    invoke-virtual {v13, v7, v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(IZ)V

    :goto_3a
    add-int/lit8 v10, v10, 0x1

    goto :goto_9

    :cond_3d
    move-object v12, p0

    return v11
.end method

.method public c(Landroid/view/View;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 3
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v0, p1}, Lb/g/d/a;->c(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 4
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_12

    .line 5
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    :cond_12
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->k:Ljava/util/List;

    return-object p1
.end method

.method public c(Landroid/view/View;I)V
    .registers 19

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    .line 7
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 8
    iget-object v0, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->k:Landroid/view/View;

    if-eqz v0, :cond_77

    .line 9
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v11

    .line 10
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v12

    .line 11
    invoke-static {}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i()Landroid/graphics/Rect;

    move-result-object v13

    .line 12
    iget-object v0, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->k:Landroid/view/View;

    invoke-virtual {v8, v0, v11}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    const/4 v14, 0x0

    .line 13
    invoke-virtual {v8, v9, v14, v12}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 14
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v15

    .line 15
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object v3, v11

    move-object v4, v13

    move-object v5, v10

    move v6, v15

    move/from16 p2, v7

    .line 16
    invoke-virtual/range {v0 .. v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;ILandroid/graphics/Rect;Landroid/graphics/Rect;Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;II)V

    .line 17
    iget v0, v13, Landroid/graphics/Rect;->left:I

    iget v1, v12, Landroid/graphics/Rect;->left:I

    if-ne v0, v1, :cond_47

    iget v0, v13, Landroid/graphics/Rect;->top:I

    iget v1, v12, Landroid/graphics/Rect;->top:I

    if-eq v0, v1, :cond_48

    :cond_47
    const/4 v14, 0x1

    :cond_48
    move/from16 v0, p2

    .line 18
    invoke-virtual {v8, v10, v13, v15, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;Landroid/graphics/Rect;II)V

    .line 19
    iget v0, v13, Landroid/graphics/Rect;->left:I

    iget v1, v12, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    .line 20
    iget v1, v13, Landroid/graphics/Rect;->top:I

    iget v2, v12, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    if-eqz v0, :cond_5c

    .line 21
    invoke-static {v9, v0}, Lb/h/m/y;->d(Landroid/view/View;I)V

    :cond_5c
    if-eqz v1, :cond_61

    .line 22
    invoke-static {v9, v1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    :cond_61
    if-eqz v14, :cond_6e

    .line 23
    invoke-virtual {v10}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    if-eqz v0, :cond_6e

    .line 24
    iget-object v1, v10, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->k:Landroid/view/View;

    invoke-virtual {v0, v8, v9, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    .line 25
    :cond_6e
    invoke-static {v11}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 26
    invoke-static {v12}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    .line 27
    invoke-static {v13}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/graphics/Rect;)V

    :cond_77
    return-void
.end method

.method public c(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 2
    invoke-virtual {p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Landroid/graphics/Rect;)V

    return-void
.end method

.method public checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3

    .line 1
    instance-of v0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public d(Landroid/view/View;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;
    .registers 8

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 2
    iget-boolean v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b:Z

    if-nez v1, :cond_77

    .line 3
    instance-of v1, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;

    const-string v2, "CoordinatorLayout"

    const/4 v3, 0x1

    if-eqz v1, :cond_24

    .line 4
    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;

    invoke-interface {p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$b;->getBehavior()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object p1

    if-nez p1, :cond_1e

    const-string v1, "Attached behavior class is null"

    .line 5
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_1e
    invoke-virtual {v0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;)V

    .line 7
    iput-boolean v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b:Z

    goto :goto_77

    .line 8
    :cond_24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const/4 v1, 0x0

    :goto_29
    if-eqz p1, :cond_3a

    .line 9
    const-class v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    .line 10
    invoke-virtual {p1, v1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;

    if-nez v1, :cond_3a

    .line 11
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_29

    :cond_3a
    if-eqz v1, :cond_75

    .line 12
    :try_start_3c
    invoke-interface {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->value()Ljava/lang/Class;

    move-result-object p1

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {p1, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    .line 13
    invoke-virtual {v0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;)V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_52} :catch_53

    goto :goto_75

    :catch_53
    move-exception p1

    .line 14
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Default behavior class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->value()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " could not be instantiated. Did you forget a default constructor?"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    :cond_75
    :goto_75
    iput-boolean v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->b:Z

    :cond_77
    :goto_77
    return-object v0
.end method

.method public d()V
    .registers 3

    .line 24
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p:Z

    if-eqz v0, :cond_18

    .line 25
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    if-nez v0, :cond_f

    .line 26
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-direct {v0, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 27
    :cond_f
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 28
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_18
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Z

    return-void
.end method

.method public d(Landroid/view/View;I)V
    .registers 5

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 17
    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a()Z

    move-result v1

    if-nez v1, :cond_20

    .line 18
    iget-object v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->k:Landroid/view/View;

    if-eqz v1, :cond_14

    .line 19
    invoke-virtual {p0, p1, v1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/view/View;I)V

    goto :goto_1f

    .line 20
    :cond_14
    iget v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->e:I

    if-ltz v0, :cond_1c

    .line 21
    invoke-virtual {p0, p1, v0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;II)V

    goto :goto_1f

    .line 22
    :cond_1c
    invoke-virtual {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;I)V

    :goto_1f
    return-void

    .line 23
    :cond_20
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .registers 13

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 2
    iget-object v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a:Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    if-eqz v1, :cond_88

    .line 3
    invoke-virtual {v1, p0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->c(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_88

    .line 4
    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Landroid/graphics/Paint;

    if-nez v2, :cond_1e

    .line 5
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iput-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Landroid/graphics/Paint;

    .line 6
    :cond_1e
    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Landroid/graphics/Paint;

    iget-object v0, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a:Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    invoke-virtual {v0, p0, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 7
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Landroid/graphics/Paint;

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 9
    invoke-virtual {p2}, Landroid/view/View;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v3, v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v4, v1

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v5, v1

    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v1

    int-to-float v6, v1

    sget-object v7, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    move-object v2, p1

    .line 12
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    .line 13
    :cond_61
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    int-to-float v3, v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    int-to-float v4, v1

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v5, v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v6, v1

    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->l:Landroid/graphics/Paint;

    move-object v2, p1

    .line 15
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 16
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 17
    :cond_88
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method public drawableStateChanged()V
    .registers 5

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->drawableStateChanged()V

    .line 2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawableState()[I

    move-result-object v0

    .line 3
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 5
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v0

    or-int/2addr v2, v0

    :cond_17
    if-eqz v2, :cond_1c

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    :cond_1c
    return-void
.end method

.method public e()V
    .registers 5

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_17

    .line 6
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 7
    invoke-virtual {p0, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_14

    const/4 v1, 0x1

    goto :goto_17

    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 8
    :cond_17
    :goto_17
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Z

    if-eq v1, v0, :cond_24

    if-eqz v1, :cond_21

    .line 9
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d()V

    goto :goto_24

    .line 10
    :cond_21
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->g()V

    :cond_24
    :goto_24
    return-void
.end method

.method public final e(Landroid/view/View;I)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 2
    iget v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->i:I

    if-eq v1, p2, :cond_11

    sub-int v1, p2, v1

    .line 3
    invoke-static {p1, v1}, Lb/h/m/y;->d(Landroid/view/View;I)V

    .line 4
    iput p2, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->i:I

    :cond_11
    return-void
.end method

.method public final e(Landroid/view/View;)Z
    .registers 3

    .line 11
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v0, p1}, Lb/g/d/a;->e(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final f()V
    .registers 9

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 2
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v0}, Lb/g/d/a;->a()V

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v0, :cond_4a

    .line 4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 5
    invoke-virtual {p0, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move-result-object v4

    .line 6
    invoke-virtual {v4, p0, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/view/View;

    .line 7
    iget-object v5, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v5, v3}, Lb/g/d/a;->a(Ljava/lang/Object;)V

    const/4 v5, 0x0

    :goto_23
    if-ge v5, v0, :cond_47

    if-ne v5, v2, :cond_28

    goto :goto_44

    .line 8
    :cond_28
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 9
    invoke-virtual {v4, p0, v3, v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 10
    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v7, v6}, Lb/g/d/a;->b(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3f

    .line 11
    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v7, v6}, Lb/g/d/a;->a(Ljava/lang/Object;)V

    .line 12
    :cond_3f
    iget-object v7, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v7, v6, v3}, Lb/g/d/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_44
    :goto_44
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    :cond_47
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 13
    :cond_4a
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->i:Lb/g/d/a;

    invoke-virtual {v1}, Lb/g/d/a;->c()Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    return-void
.end method

.method public final f(Landroid/view/View;I)V
    .registers 5

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 16
    iget v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->j:I

    if-eq v1, p2, :cond_11

    sub-int v1, p2, v1

    .line 17
    invoke-static {p1, v1}, Lb/h/m/y;->e(Landroid/view/View;I)V

    .line 18
    iput p2, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->j:I

    :cond_11
    return-void
.end method

.method public g()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p:Z

    if-eqz v0, :cond_11

    .line 2
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    if-eqz v0, :cond_11

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 4
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_11
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Z

    return-void
.end method

.method public bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->generateDefaultLayoutParams()Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move-result-object v0

    return-object v0
.end method

.method public generateDefaultLayoutParams()Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;
    .registers 3

    .line 2
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move-result-object p1

    return-object p1
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;
    .registers 4

    .line 3
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;
    .registers 3

    .line 4
    instance-of v0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    if-eqz v0, :cond_c

    .line 5
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-direct {v0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;)V

    return-object v0

    .line 6
    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_18

    .line 7
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 8
    :cond_18
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    invoke-direct {v0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public final getDependencySortedChildren()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f()V

    .line 2
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final getLastWindowInsets()Lb/h/m/g0;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    return-object v0
.end method

.method public getNestedScrollAxes()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->A:Lb/h/m/r;

    invoke-virtual {v0}, Lb/h/m/r;->a()I

    move-result v0

    return v0
.end method

.method public getStatusBarBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSuggestedMinimumHeight()I
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getSuggestedMinimumWidth()I
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->getSuggestedMinimumWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public final h()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 3
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->z:Lb/h/m/s;

    if-nez v0, :cond_18

    .line 4
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$a;

    invoke-direct {v0, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$a;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->z:Lb/h/m/s;

    .line 5
    :cond_18
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->z:Lb/h/m/s;

    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    const/16 v0, 0x500

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setSystemUiVisibility(I)V

    goto :goto_27

    :cond_23
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    :goto_27
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    .line 3
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Z

    if-eqz v0, :cond_1f

    .line 4
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    if-nez v0, :cond_16

    .line 5
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-direct {v0, p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V

    iput-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 6
    :cond_16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 8
    :cond_1f
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    if-nez v0, :cond_2c

    invoke-static {p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 9
    invoke-static {p0}, Lb/h/m/y;->P(Landroid/view/View;)V

    :cond_2c
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p:Z

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    .line 3
    iget-boolean v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->u:Z

    if-eqz v1, :cond_18

    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    if-eqz v1, :cond_18

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 5
    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->t:Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 6
    :cond_18
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->s:Landroid/view/View;

    if-eqz v1, :cond_1f

    .line 7
    invoke-virtual {p0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->onStopNestedScroll(Landroid/view/View;)V

    .line 8
    :cond_1f
    iput-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->p:Z

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget-boolean v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->w:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_26

    .line 3
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Lb/h/m/g0;->h()I

    move-result v0

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-lez v0, :cond_26

    .line 4
    iget-object v2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v3

    invoke-virtual {v2, v1, v1, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 5
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_26
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_a

    .line 2
    invoke-virtual {p0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    :cond_a
    const/4 v2, 0x0

    .line 3
    invoke-virtual {p0, p1, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/MotionEvent;I)Z

    move-result p1

    if-eq v0, v1, :cond_14

    const/4 v2, 0x3

    if-ne v0, v2, :cond_17

    .line 4
    :cond_14
    invoke-virtual {p0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    :cond_17
    return p1
.end method

.method public onLayout(ZIIII)V
    .registers 7

    .line 1
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result p1

    .line 2
    iget-object p2, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 p3, 0x0

    :goto_b
    if-ge p3, p2, :cond_36

    .line 3
    iget-object p4, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/view/View;

    .line 4
    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    move-result p5

    const/16 v0, 0x8

    if-ne p5, v0, :cond_1e

    goto :goto_33

    .line 5
    :cond_1e
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 6
    invoke-virtual {p5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object p5

    if-eqz p5, :cond_30

    .line 7
    invoke-virtual {p5, p0, p4, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result p5

    if-nez p5, :cond_33

    .line 8
    :cond_30
    invoke-virtual {p0, p4, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;I)V

    :cond_33
    :goto_33
    add-int/lit8 p3, p3, 0x1

    goto :goto_b

    :cond_36
    return-void
.end method

.method public onMeasure(II)V
    .registers 33

    move-object/from16 v7, p0

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f()V

    .line 2
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e()V

    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v8

    .line 4
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v0

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v9

    .line 6
    invoke-virtual/range {p0 .. p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    .line 7
    invoke-static/range {p0 .. p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v10

    const/4 v2, 0x1

    if-ne v10, v2, :cond_21

    const/4 v12, 0x1

    goto :goto_22

    :cond_21
    const/4 v12, 0x0

    .line 8
    :goto_22
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 9
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v14

    .line 10
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v15

    .line 11
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v16

    add-int v17, v8, v9

    add-int v18, v0, v1

    .line 12
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getSuggestedMinimumWidth()I

    move-result v0

    .line 13
    invoke-virtual/range {p0 .. p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->getSuggestedMinimumHeight()I

    move-result v1

    .line 14
    iget-object v3, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    if-eqz v3, :cond_4b

    invoke-static/range {p0 .. p0}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_4b

    const/16 v19, 0x1

    goto :goto_4d

    :cond_4b
    const/16 v19, 0x0

    .line 15
    :goto_4d
    iget-object v2, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    move v5, v0

    move v4, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_57
    if-ge v3, v6, :cond_16f

    .line 16
    iget-object v0, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v20, v0

    check-cast v20, Landroid/view/View;

    .line 17
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_73

    move/from16 v22, v3

    move/from16 v29, v6

    move/from16 v28, v8

    goto/16 :goto_167

    .line 18
    :cond_73
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 19
    iget v0, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->e:I

    if-ltz v0, :cond_ba

    if-eqz v13, :cond_ba

    .line 20
    invoke-virtual {v7, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(I)I

    move-result v0

    .line 21
    iget v11, v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->c:I

    .line 22
    invoke-static {v11}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->e(I)I

    move-result v11

    .line 23
    invoke-static {v11, v10}, Lb/h/m/e;->a(II)I

    move-result v11

    and-int/lit8 v11, v11, 0x7

    move/from16 v22, v2

    const/4 v2, 0x3

    if-ne v11, v2, :cond_97

    if-eqz v12, :cond_9c

    :cond_97
    const/4 v2, 0x5

    if-ne v11, v2, :cond_a8

    if-eqz v12, :cond_a8

    :cond_9c
    sub-int v2, v14, v9

    sub-int/2addr v2, v0

    const/4 v0, 0x0

    .line 24
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    move/from16 v21, v2

    const/4 v11, 0x0

    goto :goto_bf

    :cond_a8
    if-ne v11, v2, :cond_ac

    if-eqz v12, :cond_b1

    :cond_ac
    const/4 v2, 0x3

    if-ne v11, v2, :cond_bc

    if-eqz v12, :cond_bc

    :cond_b1
    sub-int/2addr v0, v8

    const/4 v11, 0x0

    .line 25
    invoke-static {v11, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    move/from16 v21, v0

    goto :goto_bf

    :cond_ba
    move/from16 v22, v2

    :cond_bc
    const/4 v11, 0x0

    const/16 v21, 0x0

    :goto_bf
    if-eqz v19, :cond_f1

    .line 26
    invoke-static/range {v20 .. v20}, Lb/h/m/y;->o(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_f1

    .line 27
    iget-object v0, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v0}, Lb/h/m/g0;->f()I

    move-result v0

    iget-object v2, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    .line 28
    invoke-virtual {v2}, Lb/h/m/g0;->g()I

    move-result v2

    add-int/2addr v0, v2

    .line 29
    iget-object v2, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    invoke-virtual {v2}, Lb/h/m/g0;->h()I

    move-result v2

    iget-object v11, v7, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->v:Lb/h/m/g0;

    .line 30
    invoke-virtual {v11}, Lb/h/m/g0;->e()I

    move-result v11

    add-int/2addr v2, v11

    sub-int v0, v14, v0

    .line 31
    invoke-static {v0, v13}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    sub-int v2, v16, v2

    .line 32
    invoke-static {v2, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    move v11, v0

    move/from16 v23, v2

    goto :goto_f5

    :cond_f1
    move/from16 v11, p1

    move/from16 v23, p2

    .line 33
    :goto_f5
    invoke-virtual {v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    if-eqz v0, :cond_11d

    const/16 v24, 0x0

    move-object v2, v1

    move-object/from16 v1, p0

    move-object/from16 v26, v2

    move/from16 v25, v22

    move-object/from16 v2, v20

    move/from16 v22, v3

    move v3, v11

    move/from16 v27, v4

    move/from16 v4, v21

    move/from16 v28, v8

    move v8, v5

    move/from16 v5, v23

    move/from16 v29, v6

    move/from16 v6, v24

    .line 34
    invoke-virtual/range {v0 .. v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;IIII)Z

    move-result v0

    if-nez v0, :cond_137

    goto :goto_12a

    :cond_11d
    move-object/from16 v26, v1

    move/from16 v27, v4

    move/from16 v29, v6

    move/from16 v28, v8

    move/from16 v25, v22

    move/from16 v22, v3

    move v8, v5

    :goto_12a
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move v2, v11

    move/from16 v3, v21

    move/from16 v4, v23

    .line 35
    invoke-virtual/range {v0 .. v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;IIII)V

    .line 36
    :cond_137
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    add-int v0, v17, v0

    move-object/from16 v1, v26

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v0, v2

    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v0, v2

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 37
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int v2, v18, v2

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v2, v1

    move/from16 v1, v27

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 38
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredState()I

    move-result v2

    move/from16 v11, v25

    invoke-static {v11, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v2

    move v5, v0

    move v4, v1

    :goto_167
    add-int/lit8 v3, v22, 0x1

    move/from16 v8, v28

    move/from16 v6, v29

    goto/16 :goto_57

    :cond_16f
    move v11, v2

    move v1, v4

    move v8, v5

    const/high16 v0, -0x1000000

    and-int/2addr v0, v11

    move/from16 v2, p1

    .line 39
    invoke-static {v8, v2, v0}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v0

    shl-int/lit8 v2, v11, 0x10

    move/from16 v3, p2

    .line 40
    invoke-static {v1, v3, v2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v1

    .line 41
    invoke-virtual {v7, v0, v1}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .registers 16

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    if-ge v2, v0, :cond_36

    .line 2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 3
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_16

    goto :goto_33

    .line 4
    :cond_16
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 5
    invoke-virtual {v4, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v5

    if-nez v5, :cond_23

    goto :goto_33

    .line 6
    :cond_23
    invoke-virtual {v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    if-eqz v4, :cond_33

    move-object v5, p0

    move-object v7, p1

    move v8, p2

    move v9, p3

    move v10, p4

    .line 7
    invoke-virtual/range {v4 .. v10}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FFZ)Z

    move-result v4

    or-int/2addr v3, v4

    :cond_33
    :goto_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_36
    if-eqz v3, :cond_3c

    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(I)V

    :cond_3c
    return v3
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .registers 14

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    if-ge v2, v0, :cond_35

    .line 2
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 3
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_16

    goto :goto_32

    .line 4
    :cond_16
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 5
    invoke-virtual {v4, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->a(I)Z

    move-result v5

    if-nez v5, :cond_23

    goto :goto_32

    .line 6
    :cond_23
    invoke-virtual {v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    if-eqz v4, :cond_32

    move-object v5, p0

    move-object v7, p1

    move v8, p2

    move v9, p3

    .line 7
    invoke-virtual/range {v4 .. v9}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FF)Z

    move-result v4

    or-int/2addr v3, v4

    :cond_32
    :goto_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_35
    return v3
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 1
    invoke-virtual/range {v0 .. v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;II[II)V

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 1
    invoke-virtual/range {v0 .. v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;IIIII)V

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;Landroid/view/View;II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 8

    .line 1
    instance-of v0, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;

    if-nez v0, :cond_8

    .line 2
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void

    .line 3
    :cond_8
    check-cast p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;

    .line 4
    invoke-virtual {p1}, Landroidx/customview/view/AbsSavedState;->e()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/ViewGroup;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 5
    iget-object p1, p1, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;->j:Landroid/util/SparseArray;

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_18
    if-ge v0, v1, :cond_3d

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 8
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    .line 9
    invoke-virtual {p0, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->d(Landroid/view/View;)Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    move-result-object v4

    .line 10
    invoke-virtual {v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v4

    const/4 v5, -0x1

    if-eq v3, v5, :cond_3a

    if-eqz v4, :cond_3a

    .line 11
    invoke-virtual {p1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Parcelable;

    if-eqz v3, :cond_3a

    .line 12
    invoke-virtual {v4, p0, v2, v3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    :cond_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    :cond_3d
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 9

    .line 1
    new-instance v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;

    invoke-super {p0}, Landroid/view/ViewGroup;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 2
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_38

    .line 4
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 5
    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v5

    .line 6
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 7
    invoke-virtual {v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v6

    const/4 v7, -0x1

    if-eq v5, v7, :cond_35

    if-eqz v6, :cond_35

    .line 8
    invoke-virtual {v6, p0, v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->d(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object v4

    if-eqz v4, :cond_35

    .line 9
    invoke-virtual {v1, v5, v4}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 10
    :cond_38
    iput-object v1, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$SavedState;->j:Landroid/util/SparseArray;

    return-object v0
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .registers 5

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->b(Landroid/view/View;Landroid/view/View;II)Z

    move-result p1

    return p1
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/View;I)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 2
    iget-object v3, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_15

    invoke-virtual {v0, v1, v4}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Landroid/view/MotionEvent;I)Z

    move-result v3

    if-eqz v3, :cond_2b

    goto :goto_16

    :cond_15
    const/4 v3, 0x0

    .line 3
    :goto_16
    iget-object v6, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 4
    invoke-virtual {v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v6

    if-eqz v6, :cond_2b

    .line 5
    iget-object v7, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    invoke-virtual {v6, v0, v7, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v6

    goto :goto_2c

    :cond_2b
    const/4 v6, 0x0

    .line 6
    :goto_2c
    iget-object v7, v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r:Landroid/view/View;

    const/4 v8, 0x0

    if-nez v7, :cond_37

    .line 7
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v6, v1

    goto :goto_4a

    :cond_37
    if-eqz v3, :cond_4a

    .line 8
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    const/4 v13, 0x3

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-wide v9, v11

    .line 9
    invoke-static/range {v9 .. v16}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .line 10
    invoke-super {v0, v8}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_4a
    :goto_4a
    if-eqz v8, :cond_4f

    .line 11
    invoke-virtual {v8}, Landroid/view/MotionEvent;->recycle()V

    :cond_4f
    if-eq v2, v4, :cond_54

    const/4 v1, 0x3

    if-ne v2, v1, :cond_57

    .line 12
    :cond_54
    invoke-virtual {v0, v5}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    :cond_57
    return v6
.end method

.method public requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;

    .line 2
    invoke-virtual {v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$e;->d()Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 3
    invoke-virtual {v0, p0, p1, p2, p3}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$Behavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/graphics/Rect;Z)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 p1, 0x1

    return p1

    .line 4
    :cond_14
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    move-result p1

    return p1
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    if-eqz p1, :cond_10

    .line 2
    iget-boolean p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Z

    if-nez p1, :cond_10

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->a(Z)V

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->o:Z

    :cond_10
    return-void
.end method

.method public setFitsSystemWindows(Z)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setFitsSystemWindows(Z)V

    .line 2
    invoke-virtual {p0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->h()V

    return-void
.end method

.method public setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->y:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method

.method public setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_43

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_a
    if-eqz p1, :cond_10

    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_10
    iput-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_40

    .line 4
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p1

    if-eqz p1, :cond_23

    .line 5
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 6
    :cond_23
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    .line 7
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    .line 8
    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 9
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_37

    const/4 v0, 0x1

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    :goto_38
    invoke-virtual {p1, v0, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 10
    iget-object p1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 11
    :cond_40
    invoke-static {p0}, Lb/h/m/y;->O(Landroid/view/View;)V

    :cond_43
    return-void
.end method

.method public setStatusBarBackgroundColor(I)V
    .registers 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setStatusBarBackgroundResource(I)V
    .registers 3

    if-eqz p1, :cond_b

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    :goto_c
    invoke-virtual {p0, p1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setStatusBarBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setVisibility(I)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    .line 2
    :goto_9
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_18

    .line 3
    iget-object v1, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_18
    return-void
.end method

.method public verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->x:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p1, 0x1

    :goto_e
    return p1
.end method
