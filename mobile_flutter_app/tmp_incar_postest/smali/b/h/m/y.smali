.class public Lb/h/m/y;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "PrivateConstructorForUtilityClass"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/y$j;,
        Lb/h/m/y$i;,
        Lb/h/m/y$h;,
        Lb/h/m/y$l;,
        Lb/h/m/y$f;,
        Lb/h/m/y$g;,
        Lb/h/m/y$k;
    }
.end annotation


# static fields
.field public static final a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static b:Ljava/lang/reflect/Field;

.field public static c:Z

.field public static d:Ljava/lang/reflect/Field;

.field public static e:Z

.field public static f:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static g:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Lb/h/m/c0;",
            ">;"
        }
    .end annotation
.end field

.field public static h:Ljava/lang/reflect/Field;

.field public static i:Z

.field public static j:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public static final k:[I

.field public static final l:Lb/h/m/u;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lb/h/m/y;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x0

    .line 2
    sput-object v0, Lb/h/m/y;->g:Ljava/util/WeakHashMap;

    const/4 v0, 0x0

    .line 3
    sput-boolean v0, Lb/h/m/y;->i:Z

    const/16 v2, 0x20

    new-array v2, v2, [I

    .line 4
    sget v3, Lb/h/b;->accessibility_custom_action_0:I

    aput v3, v2, v0

    sget v0, Lb/h/b;->accessibility_custom_action_1:I

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_2:I

    const/4 v1, 0x2

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_3:I

    const/4 v1, 0x3

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_4:I

    const/4 v1, 0x4

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_5:I

    const/4 v1, 0x5

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_6:I

    const/4 v1, 0x6

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_7:I

    const/4 v1, 0x7

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_8:I

    const/16 v1, 0x8

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_9:I

    const/16 v1, 0x9

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_10:I

    const/16 v1, 0xa

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_11:I

    const/16 v1, 0xb

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_12:I

    const/16 v1, 0xc

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_13:I

    const/16 v1, 0xd

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_14:I

    const/16 v1, 0xe

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_15:I

    const/16 v1, 0xf

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_16:I

    const/16 v1, 0x10

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_17:I

    const/16 v1, 0x11

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_18:I

    const/16 v1, 0x12

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_19:I

    const/16 v1, 0x13

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_20:I

    const/16 v1, 0x14

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_21:I

    const/16 v1, 0x15

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_22:I

    const/16 v1, 0x16

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_23:I

    const/16 v1, 0x17

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_24:I

    const/16 v1, 0x18

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_25:I

    const/16 v1, 0x19

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_26:I

    const/16 v1, 0x1a

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_27:I

    const/16 v1, 0x1b

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_28:I

    const/16 v1, 0x1c

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_29:I

    const/16 v1, 0x1d

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_30:I

    const/16 v1, 0x1e

    aput v0, v2, v1

    sget v0, Lb/h/b;->accessibility_custom_action_31:I

    const/16 v1, 0x1f

    aput v0, v2, v1

    sput-object v2, Lb/h/m/y;->k:[I

    .line 5
    new-instance v0, Lb/h/m/y$a;

    invoke-direct {v0}, Lb/h/m/y$a;-><init>()V

    sput-object v0, Lb/h/m/y;->l:Lb/h/m/u;

    .line 6
    new-instance v0, Lb/h/m/y$f;

    invoke-direct {v0}, Lb/h/m/y$f;-><init>()V

    return-void
.end method

.method public static final A(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 2

    .line 1
    invoke-static {}, Lb/h/m/y;->f()Lb/h/m/y$g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/h/m/y$g;->b(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static B(Landroid/view/View;)Ljava/lang/String;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    sget-object v0, Lb/h/m/y;->f:Ljava/util/WeakHashMap;

    if-nez v0, :cond_11

    const/4 p0, 0x0

    return-object p0

    .line 4
    :cond_11
    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static C(Landroid/view/View;)F
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getTranslationZ()F

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static D(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static E(Landroid/view/View;)F
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getZ()F

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static F(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->hasOnClickListeners()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static G(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->hasOverlappingRendering()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x1

    return p0
.end method

.method public static H(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->hasTransientState()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static I(Landroid/view/View;)Z
    .registers 2

    .line 1
    invoke-static {}, Lb/h/m/y;->a()Lb/h/m/y$g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/h/m/y$g;->b(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    .line 2
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    :goto_12
    return p0
.end method

.method public static J(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    return p0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    if-eqz p0, :cond_13

    const/4 p0, 0x1

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    return p0
.end method

.method public static K(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result p0

    return p0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_19

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    if-lez p0, :cond_19

    const/4 p0, 0x1

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    return p0
.end method

.method public static L(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->isNestedScrollingEnabled()Z

    move-result p0

    return p0

    .line 3
    :cond_b
    instance-of v0, p0, Lb/h/m/m;

    if-eqz v0, :cond_16

    .line 4
    check-cast p0, Lb/h/m/m;

    invoke-interface {p0}, Lb/h/m/m;->isNestedScrollingEnabled()Z

    move-result p0

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public static M(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->isPaddingRelative()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static N(Landroid/view/View;)Z
    .registers 2

    .line 1
    invoke-static {}, Lb/h/m/y;->e()Lb/h/m/y$g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/h/m/y$g;->b(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    .line 2
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    :goto_12
    return p0
.end method

.method public static O(Landroid/view/View;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->postInvalidateOnAnimation()V

    goto :goto_d

    .line 3
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :goto_d
    return-void
.end method

.method public static P(Landroid/view/View;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x14

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    goto :goto_11

    :cond_a
    const/16 v1, 0x10

    if-lt v0, v1, :cond_11

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFitSystemWindows()V

    :cond_11
    :goto_11
    return-void
.end method

.method public static Q(Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-static {p0}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    .line 3
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 4
    :goto_e
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_26

    .line 5
    move-object v1, v0

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lb/h/m/y;->p(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_21

    const/4 v0, 0x2

    .line 6
    invoke-static {p0, v0}, Lb/h/m/y;->h(Landroid/view/View;I)V

    goto :goto_26

    .line 7
    :cond_21
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_e

    :cond_26
    :goto_26
    return-void
.end method

.method public static R(Landroid/view/View;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->stopNestedScroll()V

    goto :goto_13

    .line 3
    :cond_a
    instance-of v0, p0, Lb/h/m/m;

    if-eqz v0, :cond_13

    .line 4
    check-cast p0, Lb/h/m/m;

    invoke-interface {p0}, Lb/h/m/m;->stopNestedScroll()V

    :cond_13
    :goto_13
    return-void
.end method

.method public static S(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v1, v0

    .line 2
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/CharSequence;Lb/h/m/h0/f;)I
    .registers 5

    .line 15
    invoke-static {p0}, Lb/h/m/y;->h(Landroid/view/View;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_f

    .line 16
    new-instance v1, Lb/h/m/h0/c$a;

    invoke-direct {v1, v0, p1, p2}, Lb/h/m/h0/c$a;-><init>(ILjava/lang/CharSequence;Lb/h/m/h0/f;)V

    .line 17
    invoke-static {p0, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/h0/c$a;)V

    :cond_f
    return v0
.end method

.method public static a(Landroid/view/View;)Lb/h/m/c0;
    .registers 3

    .line 34
    sget-object v0, Lb/h/m/y;->g:Ljava/util/WeakHashMap;

    if-nez v0, :cond_b

    .line 35
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lb/h/m/y;->g:Ljava/util/WeakHashMap;

    .line 36
    :cond_b
    sget-object v0, Lb/h/m/y;->g:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/c0;

    if-nez v0, :cond_1f

    .line 37
    new-instance v0, Lb/h/m/c0;

    invoke-direct {v0, p0}, Lb/h/m/c0;-><init>(Landroid/view/View;)V

    .line 38
    sget-object v1, Lb/h/m/y;->g:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1f
    return-object v0
.end method

.method public static a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;
    .registers 5

    const-string v0, "ViewCompat"

    const/4 v1, 0x3

    .line 55
    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "performReceiveContent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", view="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 58
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    :cond_3e
    sget v0, Lb/h/b;->tag_on_receive_content_listener:I

    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/t;

    if-eqz v0, :cond_59

    .line 61
    invoke-interface {v0, p0, p1}, Lb/h/m/t;->a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;

    move-result-object p1

    if-nez p1, :cond_50

    const/4 p0, 0x0

    goto :goto_58

    .line 62
    :cond_50
    invoke-static {p0}, Lb/h/m/y;->n(Landroid/view/View;)Lb/h/m/u;

    move-result-object p0

    invoke-interface {p0, p1}, Lb/h/m/u;->a(Lb/h/m/c;)Lb/h/m/c;

    move-result-object p0

    :goto_58
    return-object p0

    .line 63
    :cond_59
    invoke-static {p0}, Lb/h/m/y;->n(Landroid/view/View;)Lb/h/m/u;

    move-result-object p0

    invoke-interface {p0, p1}, Lb/h/m/u;->a(Lb/h/m/c;)Lb/h/m/c;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;
    .registers 4

    .line 48
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1b

    .line 49
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v1

    .line 51
    invoke-virtual {v1, v0}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 52
    invoke-static {v1, p0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    :cond_1b
    return-object p1
.end method

.method public static a(Landroid/view/View;Lb/h/m/g0;Landroid/graphics/Rect;)Lb/h/m/g0;
    .registers 5

    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 54
    invoke-static {p0, p1, p2}, Lb/h/m/y$h;->a(Landroid/view/View;Lb/h/m/g0;Landroid/graphics/Rect;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    :cond_b
    return-object p1
.end method

.method public static a()Lb/h/m/y$g;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/h/m/y$g<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 105
    new-instance v0, Lb/h/m/y$e;

    sget v1, Lb/h/b;->tag_accessibility_heading:I

    const-class v2, Ljava/lang/Boolean;

    const/16 v3, 0x1c

    invoke-direct {v0, v1, v2, v3}, Lb/h/m/y$e;-><init>(ILjava/lang/Class;I)V

    return-object v0
.end method

.method public static a(ILandroid/view/View;)V
    .registers 4

    .line 25
    invoke-static {p1}, Lb/h/m/y;->g(Landroid/view/View;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    .line 26
    :goto_5
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1e

    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/m/h0/c$a;

    invoke-virtual {v1}, Lb/h/m/h0/c$a;->a()I

    move-result v1

    if-ne v1, p0, :cond_1b

    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_1e

    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_1e
    :goto_1e
    return-void
.end method

.method public static a(Landroid/view/View;F)V
    .registers 4

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    :cond_9
    return-void
.end method

.method public static a(Landroid/view/View;I)V
    .registers 2

    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_19

    .line 91
    invoke-static {p0}, Lb/h/m/y;->S(Landroid/view/View;)V

    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 93
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_19

    .line 94
    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lb/h/m/y;->S(Landroid/view/View;)V

    :cond_19
    return-void
.end method

.method public static a(Landroid/view/View;II)V
    .registers 5

    .line 97
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_9

    .line 98
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setScrollIndicators(II)V

    :cond_9
    return-void
.end method

.method public static a(Landroid/view/View;IIII)V
    .registers 7

    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_a

    .line 32
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_d

    .line 33
    :cond_a
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    :goto_d
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "ContextFirst"
            }
        .end annotation
    .end param

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_9

    .line 2
    invoke-static/range {p0 .. p6}, Lb/h/m/y$j;->a(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    :cond_9
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_36

    .line 68
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 69
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ne p1, v1, :cond_3f

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_20

    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    if-eqz v0, :cond_1e

    goto :goto_20

    :cond_1e
    const/4 v0, 0x0

    goto :goto_21

    :cond_20
    :goto_20
    const/4 v0, 0x1

    :goto_21
    if-eqz p1, :cond_3f

    if-eqz v0, :cond_3f

    .line 73
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 75
    :cond_32
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3f

    .line 76
    :cond_36
    instance-of v0, p0, Lb/h/m/x;

    if-eqz v0, :cond_3f

    .line 77
    check-cast p0, Lb/h/m/x;

    invoke-interface {p0, p1}, Lb/h/m/x;->setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    .registers 4

    .line 78
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_36

    .line 79
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 80
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ne p1, v1, :cond_3f

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    if-nez v0, :cond_20

    .line 83
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    if-eqz v0, :cond_1e

    goto :goto_20

    :cond_1e
    const/4 v0, 0x0

    goto :goto_21

    :cond_20
    :goto_20
    const/4 v0, 0x1

    :goto_21
    if-eqz p1, :cond_3f

    if-eqz v0, :cond_3f

    .line 84
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 86
    :cond_32
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3f

    .line 87
    :cond_36
    instance-of v0, p0, Lb/h/m/x;

    if-eqz v0, :cond_3f

    .line 88
    check-cast p0, Lb/h/m/x;

    invoke-interface {p0, p1}, Lb/h/m/x;->setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 4

    .line 95
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_9

    .line 96
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_9
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 65
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_d

    .line 66
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_d
    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/a;)V
    .registers 3

    if-nez p1, :cond_f

    .line 4
    invoke-static {p0}, Lb/h/m/y;->c(Landroid/view/View;)Landroid/view/View$AccessibilityDelegate;

    move-result-object v0

    instance-of v0, v0, Lb/h/m/a$a;

    if-eqz v0, :cond_f

    .line 5
    new-instance p1, Lb/h/m/a;

    invoke-direct {p1}, Lb/h/m/a;-><init>()V

    :cond_f
    if-nez p1, :cond_13

    const/4 p1, 0x0

    goto :goto_17

    .line 6
    :cond_13
    invoke-virtual {p1}, Lb/h/m/a;->a()Landroid/view/View$AccessibilityDelegate;

    move-result-object p1

    :goto_17
    invoke-virtual {p0, p1}, Landroid/view/View;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/h0/c$a;)V
    .registers 4

    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1b

    .line 21
    invoke-static {p0}, Lb/h/m/y;->v(Landroid/view/View;)Lb/h/m/a;

    .line 22
    invoke-virtual {p1}, Lb/h/m/h0/c$a;->a()I

    move-result v0

    invoke-static {v0, p0}, Lb/h/m/y;->a(ILandroid/view/View;)V

    .line 23
    invoke-static {p0}, Lb/h/m/y;->g(Landroid/view/View;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    .line 24
    invoke-static {p0, p1}, Lb/h/m/y;->c(Landroid/view/View;I)V

    :cond_1b
    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/h0/c$a;Ljava/lang/CharSequence;Lb/h/m/h0/f;)V
    .registers 4

    if-nez p3, :cond_c

    if-nez p2, :cond_c

    .line 18
    invoke-virtual {p1}, Lb/h/m/h0/c$a;->a()I

    move-result p1

    invoke-static {p0, p1}, Lb/h/m/y;->f(Landroid/view/View;I)V

    goto :goto_13

    .line 19
    :cond_c
    invoke-virtual {p1, p2, p3}, Lb/h/m/h0/c$a;->a(Ljava/lang/CharSequence;Lb/h/m/h0/f;)Lb/h/m/h0/c$a;

    move-result-object p1

    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/h0/c$a;)V

    :goto_13
    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 2

    .line 3
    invoke-virtual {p1}, Lb/h/m/h0/c;->z()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/s;)V
    .registers 4

    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 47
    invoke-static {p0, p1}, Lb/h/m/y$h;->a(Landroid/view/View;Lb/h/m/s;)V

    :cond_9
    return-void
.end method

.method public static a(Landroid/view/View;Lb/h/m/w;)V
    .registers 4

    .line 99
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_13

    if-eqz p1, :cond_d

    .line 100
    invoke-virtual {p1}, Lb/h/m/w;->a()Ljava/lang/Object;

    move-result-object p1

    goto :goto_e

    :cond_d
    const/4 p1, 0x0

    :goto_e
    check-cast p1, Landroid/view/PointerIcon;

    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setPointerIcon(Landroid/view/PointerIcon;)V

    :cond_13
    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 4

    .line 29
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_d

    .line 30
    invoke-static {}, Lb/h/m/y;->f()Lb/h/m/y$g;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lb/h/m/y$g;->b(Landroid/view/View;Ljava/lang/Object;)V

    :cond_d
    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_11

    .line 9
    :cond_a
    invoke-static {}, Landroid/animation/ValueAnimator;->getFrameDelay()J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_11
    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/Runnable;J)V
    .registers 6

    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    goto :goto_12

    .line 12
    :cond_a
    invoke-static {}, Landroid/animation/ValueAnimator;->getFrameDelay()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_12
    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/String;)V
    .registers 4

    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setTransitionName(Ljava/lang/String;)V

    goto :goto_1a

    .line 43
    :cond_a
    sget-object v0, Lb/h/m/y;->f:Ljava/util/WeakHashMap;

    if-nez v0, :cond_15

    .line 44
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lb/h/m/y;->f:Ljava/util/WeakHashMap;

    .line 45
    :cond_15
    sget-object v0, Lb/h/m/y;->f:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1a
    return-void
.end method

.method public static a(Landroid/view/View;Z)V
    .registers 3

    .line 104
    invoke-static {}, Lb/h/m/y;->a()Lb/h/m/y$g;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Lb/h/m/y$g;->b(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public static a(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 5

    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 14
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 4

    .line 102
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_8

    const/4 p0, 0x0

    return p0

    .line 103
    :cond_8
    invoke-static {p0}, Lb/h/m/y$l;->a(Landroid/view/View;)Lb/h/m/y$l;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lb/h/m/y$l;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static b()I
    .registers 3

    .line 19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 20
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    return v0

    .line 21
    :cond_b
    sget-object v0, Lb/h/m/y;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    const v2, 0xffffff

    if-le v1, v2, :cond_19

    const/4 v1, 0x1

    .line 22
    :cond_19
    sget-object v2, Lb/h/m/y;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_b

    return v0
.end method

.method public static b(Landroid/view/View;)Lb/h/m/a;
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/m/y;->c(Landroid/view/View;)Landroid/view/View$AccessibilityDelegate;

    move-result-object p0

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return-object p0

    .line 2
    :cond_8
    instance-of v0, p0, Lb/h/m/a$a;

    if-eqz v0, :cond_11

    .line 3
    check-cast p0, Lb/h/m/a$a;

    iget-object p0, p0, Lb/h/m/a$a;->a:Lb/h/m/a;

    return-object p0

    .line 4
    :cond_11
    new-instance v0, Lb/h/m/a;

    invoke-direct {v0, p0}, Lb/h/m/a;-><init>(Landroid/view/View$AccessibilityDelegate;)V

    return-object v0
.end method

.method public static b(Landroid/view/View;Lb/h/m/g0;)Lb/h/m/g0;
    .registers 4

    .line 8
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_1b

    .line 9
    invoke-virtual {p1}, Lb/h/m/g0;->k()Landroid/view/WindowInsets;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v1

    .line 11
    invoke-virtual {v1, v0}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 12
    invoke-static {v1, p0}, Lb/h/m/g0;->a(Landroid/view/WindowInsets;Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    :cond_1b
    return-object p1
.end method

.method public static b(Landroid/view/View;F)V
    .registers 4

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationZ(F)V

    :cond_9
    return-void
.end method

.method public static b(Landroid/view/View;I)V
    .registers 2

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_19

    .line 15
    invoke-static {p0}, Lb/h/m/y;->S(Landroid/view/View;)V

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 17
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_19

    .line 18
    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lb/h/m/y;->S(Landroid/view/View;)V

    :cond_19
    return-void
.end method

.method public static b(Landroid/view/View;Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setFitsSystemWindows(Z)V

    return-void
.end method

.method public static b(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 4

    .line 23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_8

    const/4 p0, 0x0

    return p0

    .line 24
    :cond_8
    invoke-static {p0}, Lb/h/m/y$l;->a(Landroid/view/View;)Lb/h/m/y$l;

    move-result-object p0

    invoke-virtual {p0, p1}, Lb/h/m/y$l;->a(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static c()Landroid/graphics/Rect;
    .registers 2

    .line 1
    sget-object v0, Lb/h/m/y;->j:Ljava/lang/ThreadLocal;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lb/h/m/y;->j:Ljava/lang/ThreadLocal;

    .line 3
    :cond_b
    sget-object v0, Lb/h/m/y;->j:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Rect;

    if-nez v0, :cond_1f

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 5
    sget-object v1, Lb/h/m/y;->j:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 6
    :cond_1f
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    return-object v0
.end method

.method public static c(Landroid/view/View;)Landroid/view/View$AccessibilityDelegate;
    .registers 3

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_b

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    move-result-object p0

    return-object p0

    .line 9
    :cond_b
    invoke-static {p0}, Lb/h/m/y;->d(Landroid/view/View;)Landroid/view/View$AccessibilityDelegate;

    move-result-object p0

    return-object p0
.end method

.method public static c(Landroid/view/View;F)V
    .registers 4

    .line 12
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_9

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setZ(F)V

    :cond_9
    return-void
.end method

.method public static c(Landroid/view/View;I)V
    .registers 6

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "accessibility"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 15
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_13

    return-void

    .line 16
    :cond_13
    invoke-static {p0}, Lb/h/m/y;->f(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_21

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_21

    const/4 v1, 0x1

    goto :goto_22

    :cond_21
    const/4 v1, 0x0

    .line 18
    :goto_22
    invoke-static {p0}, Lb/h/m/y;->e(Landroid/view/View;)I

    move-result v2

    const/16 v3, 0x20

    if-nez v2, :cond_83

    if-eqz v1, :cond_2d

    goto :goto_83

    :cond_2d
    if-ne p1, v3, :cond_51

    .line 19
    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 21
    invoke-virtual {v1, v3}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    .line 22
    invoke-virtual {v1, p1}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    .line 23
    invoke-virtual {v1, p0}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;)V

    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 25
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object p1

    invoke-static {p0}, Lb/h/m/y;->f(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->sendAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    goto :goto_a5

    .line 27
    :cond_51
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_a5

    .line 28
    :try_start_57
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, p0, p0, p1}, Landroid/view/ViewParent;->notifySubtreeAccessibilityStateChanged(Landroid/view/View;Landroid/view/View;I)V
    :try_end_5e
    .catch Ljava/lang/AbstractMethodError; {:try_start_57 .. :try_end_5e} :catch_5f

    goto :goto_a5

    :catch_5f
    move-exception p1

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " does not fully implement ViewParent"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ViewCompat"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a5

    .line 30
    :cond_83
    :goto_83
    invoke-static {}, Landroid/view/accessibility/AccessibilityEvent;->obtain()Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v0

    if-eqz v1, :cond_8a

    goto :goto_8c

    :cond_8a
    const/16 v3, 0x800

    .line 31
    :goto_8c
    invoke-virtual {v0, v3}, Landroid/view/accessibility/AccessibilityEvent;->setEventType(I)V

    .line 32
    invoke-virtual {v0, p1}, Landroid/view/accessibility/AccessibilityEvent;->setContentChangeTypes(I)V

    if-eqz v1, :cond_a2

    .line 33
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object p1

    invoke-static {p0}, Lb/h/m/y;->f(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    invoke-static {p0}, Lb/h/m/y;->Q(Landroid/view/View;)V

    .line 35
    :cond_a2
    invoke-virtual {p0, v0}, Landroid/view/View;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_a5
    :goto_a5
    return-void
.end method

.method public static c(Landroid/view/View;Z)V
    .registers 4

    .line 10
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_9

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setHasTransientState(Z)V

    :cond_9
    return-void
.end method

.method public static d(Landroid/view/View;)Landroid/view/View$AccessibilityDelegate;
    .registers 5

    .line 1
    sget-boolean v0, Lb/h/m/y;->i:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    .line 2
    :cond_6
    sget-object v0, Lb/h/m/y;->h:Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    if-nez v0, :cond_1c

    .line 3
    :try_start_b
    const-class v0, Landroid/view/View;

    const-string v3, "mAccessibilityDelegate"

    .line 4
    invoke-virtual {v0, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lb/h/m/y;->h:Ljava/lang/reflect/Field;

    .line 5
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_19

    goto :goto_1c

    .line 6
    :catchall_19
    sput-boolean v2, Lb/h/m/y;->i:Z

    return-object v1

    .line 7
    :cond_1c
    :goto_1c
    :try_start_1c
    sget-object v0, Lb/h/m/y;->h:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 8
    instance-of v0, p0, Landroid/view/View$AccessibilityDelegate;

    if-eqz v0, :cond_29

    .line 9
    check-cast p0, Landroid/view/View$AccessibilityDelegate;
    :try_end_28
    .catchall {:try_start_1c .. :try_end_28} :catchall_2a

    return-object p0

    :cond_29
    return-object v1

    .line 10
    :catchall_2a
    sput-boolean v2, Lb/h/m/y;->i:Z

    return-object v1
.end method

.method public static d()Lb/h/m/y$g;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/h/m/y$g<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 27
    new-instance v0, Lb/h/m/y$c;

    sget v1, Lb/h/b;->tag_accessibility_pane_title:I

    const-class v2, Ljava/lang/CharSequence;

    const/16 v3, 0x8

    const/16 v4, 0x1c

    invoke-direct {v0, v1, v2, v3, v4}, Lb/h/m/y$c;-><init>(ILjava/lang/Class;II)V

    return-object v0
.end method

.method public static d(Landroid/view/View;I)V
    .registers 8

    .line 11
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_a

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_6b

    :cond_a
    const/16 v1, 0x15

    if-lt v0, v1, :cond_68

    .line 13
    invoke-static {}, Lb/h/m/y;->c()Landroid/graphics/Rect;

    move-result-object v0

    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 15
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_47

    .line 16
    move-object v1, v2

    check-cast v1, Landroid/view/View;

    .line 17
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-virtual {v0, v3, v4, v5, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v3

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result v5

    .line 20
    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Rect;->intersects(IIII)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 21
    :cond_47
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;I)V

    if-eqz v1, :cond_6b

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result p0

    .line 24
    invoke-virtual {v0, p1, v1, v3, p0}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result p0

    if-eqz p0, :cond_6b

    .line 25
    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_6b

    .line 26
    :cond_68
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;I)V

    :cond_6b
    :goto_6b
    return-void
.end method

.method public static e(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getAccessibilityLiveRegion()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static e()Lb/h/m/y$g;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/h/m/y$g<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 19
    new-instance v0, Lb/h/m/y$b;

    sget v1, Lb/h/b;->tag_screen_reader_focusable:I

    const-class v2, Ljava/lang/Boolean;

    const/16 v3, 0x1c

    invoke-direct {v0, v1, v2, v3}, Lb/h/m/y$b;-><init>(ILjava/lang/Class;I)V

    return-object v0
.end method

.method public static e(Landroid/view/View;I)V
    .registers 8

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_a

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_6b

    :cond_a
    const/16 v1, 0x15

    if-lt v0, v1, :cond_68

    .line 5
    invoke-static {}, Lb/h/m/y;->c()Landroid/graphics/Rect;

    move-result-object v0

    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 7
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_47

    .line 8
    move-object v1, v2

    check-cast v1, Landroid/view/View;

    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v5

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-virtual {v0, v3, v4, v5, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v3

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result v5

    .line 12
    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Rect;->intersects(IIII)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 13
    :cond_47
    invoke-static {p0, p1}, Lb/h/m/y;->b(Landroid/view/View;I)V

    if-eqz v1, :cond_6b

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result p0

    .line 16
    invoke-virtual {v0, p1, v1, v3, p0}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result p0

    if-eqz p0, :cond_6b

    .line 17
    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_6b

    .line 18
    :cond_68
    invoke-static {p0, p1}, Lb/h/m/y;->b(Landroid/view/View;I)V

    :cond_6b
    :goto_6b
    return-void
.end method

.method public static f()Lb/h/m/y$g;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/h/m/y$g<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 5
    new-instance v0, Lb/h/m/y$d;

    sget v1, Lb/h/b;->tag_state_description:I

    const-class v2, Ljava/lang/CharSequence;

    const/16 v3, 0x40

    const/16 v4, 0x1e

    invoke-direct {v0, v1, v2, v3, v4}, Lb/h/m/y$d;-><init>(ILjava/lang/Class;II)V

    return-object v0
.end method

.method public static f(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 2

    .line 4
    invoke-static {}, Lb/h/m/y;->d()Lb/h/m/y$g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/h/m/y$g;->b(Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static f(Landroid/view/View;I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_d

    .line 2
    invoke-static {p1, p0}, Lb/h/m/y;->a(ILandroid/view/View;)V

    const/4 p1, 0x0

    .line 3
    invoke-static {p0, p1}, Lb/h/m/y;->c(Landroid/view/View;I)V

    :cond_d
    return-void
.end method

.method public static g(Landroid/view/View;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Ljava/util/List<",
            "Lb/h/m/h0/c$a;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Lb/h/b;->tag_accessibility_actions:I

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_14

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    sget v1, Lb/h/b;->tag_accessibility_actions:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_14
    return-object v0
.end method

.method public static g(Landroid/view/View;I)V
    .registers 4

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_9

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setAccessibilityLiveRegion(I)V

    :cond_9
    return-void
.end method

.method public static h(Landroid/view/View;)I
    .registers 10

    .line 4
    invoke-static {p0}, Lb/h/m/y;->g(Landroid/view/View;)Ljava/util/List;

    move-result-object p0

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    .line 5
    :goto_8
    sget-object v4, Lb/h/m/y;->k:[I

    array-length v5, v4

    if-ge v2, v5, :cond_33

    if-ne v3, v0, :cond_33

    .line 6
    aget v4, v4, v2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 7
    :goto_14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_2d

    .line 8
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/h/m/h0/c$a;

    invoke-virtual {v8}, Lb/h/m/h0/c$a;->a()I

    move-result v8

    if-eq v8, v4, :cond_28

    const/4 v8, 0x1

    goto :goto_29

    :cond_28
    const/4 v8, 0x0

    :goto_29
    and-int/2addr v7, v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_14

    :cond_2d
    if-eqz v7, :cond_30

    move v3, v4

    :cond_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_33
    return v3
.end method

.method public static h(Landroid/view/View;I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_15

    :cond_a
    const/16 v1, 0x10

    if-lt v0, v1, :cond_15

    const/4 v0, 0x4

    if-ne p1, v0, :cond_12

    const/4 p1, 0x2

    .line 3
    :cond_12
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_15
    :goto_15
    return-void
.end method

.method public static i(Landroid/view/View;)Landroid/content/res/ColorStateList;
    .registers 3

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    .line 5
    :cond_b
    instance-of v0, p0, Lb/h/m/x;

    if-eqz v0, :cond_16

    .line 6
    check-cast p0, Lb/h/m/x;

    invoke-interface {p0}, Lb/h/m/x;->getSupportBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_17

    :cond_16
    const/4 p0, 0x0

    :goto_17
    return-object p0
.end method

.method public static i(Landroid/view/View;I)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_9

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAutofill(I)V

    :cond_9
    return-void
.end method

.method public static j(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    instance-of v0, p0, Lb/h/m/x;

    if-eqz v0, :cond_16

    .line 4
    check-cast p0, Lb/h/m/x;

    invoke-interface {p0}, Lb/h/m/x;->getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;

    move-result-object p0

    goto :goto_17

    :cond_16
    const/4 p0, 0x0

    :goto_17
    return-object p0
.end method

.method public static k(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getClipBounds()Landroid/graphics/Rect;

    move-result-object p0

    return-object p0

    :cond_b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static l(Landroid/view/View;)Landroid/view/Display;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    invoke-static {p0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    .line 5
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    return-object p0

    :cond_22
    const/4 p0, 0x0

    return-object p0
.end method

.method public static m(Landroid/view/View;)F
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static n(Landroid/view/View;)Lb/h/m/u;
    .registers 2

    .line 1
    instance-of v0, p0, Lb/h/m/u;

    if-eqz v0, :cond_7

    .line 2
    check-cast p0, Lb/h/m/u;

    return-object p0

    .line 3
    :cond_7
    sget-object p0, Lb/h/m/y;->l:Lb/h/m/u;

    return-object p0
.end method

.method public static o(Landroid/view/View;)Z
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static p(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getImportantForAccessibility()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static q(Landroid/view/View;)I
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getImportantForAutofill()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static r(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static s(Landroid/view/View;)I
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getMinimumHeight()I

    move-result p0

    return p0

    .line 3
    :cond_b
    sget-boolean v0, Lb/h/m/y;->e:Z

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    .line 4
    :try_start_10
    const-class v1, Landroid/view/View;

    const-string v2, "mMinHeight"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/h/m/y;->d:Ljava/lang/reflect/Field;

    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldException; {:try_start_10 .. :try_end_1d} :catch_1d

    .line 6
    :catch_1d
    sput-boolean v0, Lb/h/m/y;->e:Z

    .line 7
    :cond_1f
    sget-object v0, Lb/h/m/y;->d:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2e

    .line 8
    :try_start_23
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_2d} :catch_2e

    return p0

    :catch_2e
    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public static t(Landroid/view/View;)I
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getMinimumWidth()I

    move-result p0

    return p0

    .line 3
    :cond_b
    sget-boolean v0, Lb/h/m/y;->c:Z

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    .line 4
    :try_start_10
    const-class v1, Landroid/view/View;

    const-string v2, "mMinWidth"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/h/m/y;->b:Ljava/lang/reflect/Field;

    .line 5
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldException; {:try_start_10 .. :try_end_1d} :catch_1d

    .line 6
    :catch_1d
    sput-boolean v0, Lb/h/m/y;->c:Z

    .line 7
    :cond_1f
    sget-object v0, Lb/h/m/y;->b:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2e

    .line 8
    :try_start_23
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_2d} :catch_2e

    return p0

    :catch_2e
    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public static u(Landroid/view/View;)[Ljava/lang/String;
    .registers 2

    .line 1
    sget v0, Lb/h/b;->tag_on_receive_content_mime_types:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public static v(Landroid/view/View;)Lb/h/m/a;
    .registers 2

    .line 1
    invoke-static {p0}, Lb/h/m/y;->b(Landroid/view/View;)Lb/h/m/a;

    move-result-object v0

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lb/h/m/a;

    invoke-direct {v0}, Lb/h/m/a;-><init>()V

    .line 3
    :cond_b
    invoke-static {p0, v0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    return-object v0
.end method

.method public static w(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result p0

    return p0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p0

    return p0
.end method

.method public static x(Landroid/view/View;)I
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result p0

    return p0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    return p0
.end method

.method public static y(Landroid/view/View;)Landroid/view/ViewParent;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    return-object p0
.end method

.method public static z(Landroid/view/View;)Lb/h/m/g0;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    .line 2
    invoke-static {p0}, Lb/h/m/y$i;->a(Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    :cond_b
    const/16 v1, 0x15

    if-lt v0, v1, :cond_14

    .line 3
    invoke-static {p0}, Lb/h/m/y$h;->a(Landroid/view/View;)Lb/h/m/g0;

    move-result-object p0

    return-object p0

    :cond_14
    const/4 p0, 0x0

    return-object p0
.end method
