.class public Landroidx/appcompat/app/AppCompatDelegateImpl;
.super Lb/b/k/c;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Lb/b/p/j/g$a;
.implements Landroid/view/LayoutInflater$Factory2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/AppCompatDelegateImpl$m;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$l;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$k;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$j;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$o;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$q;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$p;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$n;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$s;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$h;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$t;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$i;,
        Landroidx/appcompat/app/AppCompatDelegateImpl$r;
    }
.end annotation


# static fields
.field public static final i0:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final j0:Z

.field public static final k0:[I

.field public static final l0:Z

.field public static final m0:Z

.field public static n0:Z


# instance fields
.field public A:Z

.field public B:Z

.field public C:Landroid/view/ViewGroup;

.field public D:Landroid/widget/TextView;

.field public E:Landroid/view/View;

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

.field public O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:I

.field public V:I

.field public W:Z

.field public X:Z

.field public Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

.field public Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

.field public a0:Z

.field public b0:I

.field public final c0:Ljava/lang/Runnable;

.field public d0:Z

.field public e0:Landroid/graphics/Rect;

.field public f0:Landroid/graphics/Rect;

.field public g0:Lb/b/k/e;

.field public h0:Lb/b/k/f;

.field public final k:Ljava/lang/Object;

.field public final l:Landroid/content/Context;

.field public m:Landroid/view/Window;

.field public n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

.field public final o:Lb/b/k/b;

.field public p:Landroidx/appcompat/app/ActionBar;

.field public q:Landroid/view/MenuInflater;

.field public r:Ljava/lang/CharSequence;

.field public s:Lb/b/q/o;

.field public t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

.field public u:Landroidx/appcompat/app/AppCompatDelegateImpl$t;

.field public v:Lb/b/p/b;

.field public w:Landroidx/appcompat/widget/ActionBarContextView;

.field public x:Landroid/widget/PopupWindow;

.field public y:Ljava/lang/Runnable;

.field public z:Lb/h/m/c0;


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    sput-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->i0:Lb/e/g;

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x15

    if-ge v0, v3, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    sput-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->j0:Z

    new-array v0, v2, [I

    const v3, 0x1010054

    aput v3, v0, v1

    .line 3
    sput-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k0:[I

    .line 4
    sget-object v0, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string v3, "robolectric"

    .line 5
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/2addr v0, v2

    sput-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l0:Z

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v0, v3, :cond_2f

    const/4 v1, 0x1

    :cond_2f
    sput-boolean v1, Landroidx/appcompat/app/AppCompatDelegateImpl;->m0:Z

    .line 7
    sget-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->j0:Z

    if-eqz v0, :cond_47

    sget-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n0:Z

    if-nez v0, :cond_47

    .line 8
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 9
    new-instance v1, Landroidx/appcompat/app/AppCompatDelegateImpl$a;

    invoke-direct {v1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$a;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 10
    sput-boolean v2, Landroidx/appcompat/app/AppCompatDelegateImpl;->n0:Z

    :cond_47
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lb/b/k/b;)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0, p2, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;-><init>(Landroid/content/Context;Landroid/view/Window;Lb/b/k/b;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;Lb/b/k/b;)V
    .registers 5

    .line 2
    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;-><init>(Landroid/content/Context;Landroid/view/Window;Lb/b/k/b;Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/Window;Lb/b/k/b;Ljava/lang/Object;)V
    .registers 7

    .line 3
    invoke-direct {p0}, Lb/b/k/c;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->A:Z

    const/16 v0, -0x64

    .line 6
    iput v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    .line 7
    new-instance v1, Landroidx/appcompat/app/AppCompatDelegateImpl$b;

    invoke-direct {v1, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$b;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->c0:Ljava/lang/Runnable;

    .line 8
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 9
    iput-object p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->o:Lb/b/k/b;

    .line 10
    iput-object p4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    .line 11
    iget p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    if-ne p1, v0, :cond_32

    instance-of p1, p4, Landroid/app/Dialog;

    if-eqz p1, :cond_32

    .line 12
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->D()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object p1

    if-eqz p1, :cond_32

    .line 13
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->q()Lb/b/k/c;

    move-result-object p1

    invoke-virtual {p1}, Lb/b/k/c;->a()I

    move-result p1

    iput p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    .line 14
    :cond_32
    iget p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    if-ne p1, v0, :cond_5f

    .line 15
    sget-object p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->i0:Lb/e/g;

    iget-object p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_5f

    .line 16
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    .line 17
    sget-object p1, Landroidx/appcompat/app/AppCompatDelegateImpl;->i0:Lb/e/g;

    iget-object p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5f
    if-eqz p2, :cond_64

    .line 18
    invoke-virtual {p0, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/Window;)V

    .line 19
    :cond_64
    invoke-static {}, Lb/b/q/f;->c()V

    return-void
.end method

.method public static a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)Landroid/content/res/Configuration;
    .registers 6

    .line 268
    new-instance v0, Landroid/content/res/Configuration;

    invoke-direct {v0}, Landroid/content/res/Configuration;-><init>()V

    const/4 v1, 0x0

    .line 269
    iput v1, v0, Landroid/content/res/Configuration;->fontScale:F

    if-eqz p1, :cond_104

    .line 270
    invoke-virtual {p0, p1}, Landroid/content/res/Configuration;->diff(Landroid/content/res/Configuration;)I

    move-result v1

    if-nez v1, :cond_12

    goto/16 :goto_104

    .line 271
    :cond_12
    iget v1, p0, Landroid/content/res/Configuration;->fontScale:F

    iget v2, p1, Landroid/content/res/Configuration;->fontScale:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1c

    .line 272
    iput v2, v0, Landroid/content/res/Configuration;->fontScale:F

    .line 273
    :cond_1c
    iget v1, p0, Landroid/content/res/Configuration;->mcc:I

    iget v2, p1, Landroid/content/res/Configuration;->mcc:I

    if-eq v1, v2, :cond_24

    .line 274
    iput v2, v0, Landroid/content/res/Configuration;->mcc:I

    .line 275
    :cond_24
    iget v1, p0, Landroid/content/res/Configuration;->mnc:I

    iget v2, p1, Landroid/content/res/Configuration;->mnc:I

    if-eq v1, v2, :cond_2c

    .line 276
    iput v2, v0, Landroid/content/res/Configuration;->mnc:I

    .line 277
    :cond_2c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_36

    .line 278
    invoke-static {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$l;->a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    goto :goto_44

    .line 279
    :cond_36
    iget-object v1, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    iget-object v2, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-static {v1, v2}, Lb/h/l/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    .line 280
    iget-object v1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    iput-object v1, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 281
    :cond_44
    :goto_44
    iget v1, p0, Landroid/content/res/Configuration;->touchscreen:I

    iget v2, p1, Landroid/content/res/Configuration;->touchscreen:I

    if-eq v1, v2, :cond_4c

    .line 282
    iput v2, v0, Landroid/content/res/Configuration;->touchscreen:I

    .line 283
    :cond_4c
    iget v1, p0, Landroid/content/res/Configuration;->keyboard:I

    iget v2, p1, Landroid/content/res/Configuration;->keyboard:I

    if-eq v1, v2, :cond_54

    .line 284
    iput v2, v0, Landroid/content/res/Configuration;->keyboard:I

    .line 285
    :cond_54
    iget v1, p0, Landroid/content/res/Configuration;->keyboardHidden:I

    iget v2, p1, Landroid/content/res/Configuration;->keyboardHidden:I

    if-eq v1, v2, :cond_5c

    .line 286
    iput v2, v0, Landroid/content/res/Configuration;->keyboardHidden:I

    .line 287
    :cond_5c
    iget v1, p0, Landroid/content/res/Configuration;->navigation:I

    iget v2, p1, Landroid/content/res/Configuration;->navigation:I

    if-eq v1, v2, :cond_64

    .line 288
    iput v2, v0, Landroid/content/res/Configuration;->navigation:I

    .line 289
    :cond_64
    iget v1, p0, Landroid/content/res/Configuration;->navigationHidden:I

    iget v2, p1, Landroid/content/res/Configuration;->navigationHidden:I

    if-eq v1, v2, :cond_6c

    .line 290
    iput v2, v0, Landroid/content/res/Configuration;->navigationHidden:I

    .line 291
    :cond_6c
    iget v1, p0, Landroid/content/res/Configuration;->orientation:I

    iget v2, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v1, v2, :cond_74

    .line 292
    iput v2, v0, Landroid/content/res/Configuration;->orientation:I

    .line 293
    :cond_74
    iget v1, p0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v1, v1, 0xf

    iget v2, p1, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v3, v2, 0xf

    if-eq v1, v3, :cond_85

    .line 294
    iget v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v2, v2, 0xf

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    .line 295
    :cond_85
    iget v1, p0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v1, v1, 0xc0

    iget v2, p1, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v3, v2, 0xc0

    if-eq v1, v3, :cond_96

    .line 296
    iget v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v2, v2, 0xc0

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    .line 297
    :cond_96
    iget v1, p0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v1, v1, 0x30

    iget v2, p1, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v3, v2, 0x30

    if-eq v1, v3, :cond_a7

    .line 298
    iget v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v2, v2, 0x30

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    .line 299
    :cond_a7
    iget v1, p0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v1, v1, 0x300

    iget v2, p1, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v3, v2, 0x300

    if-eq v1, v3, :cond_b8

    .line 300
    iget v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit16 v2, v2, 0x300

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->screenLayout:I

    .line 301
    :cond_b8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_c1

    .line 302
    invoke-static {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$m;->a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    .line 303
    :cond_c1
    iget v1, p0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v1, v1, 0xf

    iget v2, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v3, v2, 0xf

    if-eq v1, v3, :cond_d2

    .line 304
    iget v1, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0xf

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->uiMode:I

    .line 305
    :cond_d2
    iget v1, p0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v1, v1, 0x30

    iget v2, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v3, v2, 0x30

    if-eq v1, v3, :cond_e3

    .line 306
    iget v1, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    or-int/2addr v1, v2

    iput v1, v0, Landroid/content/res/Configuration;->uiMode:I

    .line 307
    :cond_e3
    iget v1, p0, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v2, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    if-eq v1, v2, :cond_eb

    .line 308
    iput v2, v0, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 309
    :cond_eb
    iget v1, p0, Landroid/content/res/Configuration;->screenHeightDp:I

    iget v2, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    if-eq v1, v2, :cond_f3

    .line 310
    iput v2, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 311
    :cond_f3
    iget v1, p0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    iget v2, p1, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    if-eq v1, v2, :cond_fb

    .line 312
    iput v2, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 313
    :cond_fb
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_104

    .line 314
    invoke-static {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    :cond_104
    :goto_104
    return-object v0
.end method


# virtual methods
.method public final A()Landroidx/appcompat/app/ActionBar;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    return-object v0
.end method

.method public final B()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->B:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    if-eqz v0, :cond_10

    invoke-static {v0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public final C()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->B:Z

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    new-instance v0, Landroid/util/AndroidRuntimeException;

    const-string v1, "Window feature must be requested before adding content"

    invoke-direct {v0, v1}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final D()Landroidx/appcompat/app/AppCompatActivity;
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    :goto_2
    const/4 v1, 0x0

    if-eqz v0, :cond_17

    .line 2
    instance-of v2, v0, Landroidx/appcompat/app/AppCompatActivity;

    if-eqz v2, :cond_c

    .line 3
    check-cast v0, Landroidx/appcompat/app/AppCompatActivity;

    return-object v0

    .line 4
    :cond_c
    instance-of v2, v0, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_17

    .line 5
    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_2

    :cond_17
    return-object v1
.end method

.method public a()I
    .registers 2

    .line 235
    iget v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    return v0
.end method

.method public a(Landroid/content/Context;I)I
    .registers 5

    const/16 v0, -0x64

    const/4 v1, -0x1

    if-eq p2, v0, :cond_46

    if-eq p2, v1, :cond_45

    if-eqz p2, :cond_23

    const/4 v0, 0x1

    if-eq p2, v0, :cond_45

    const/4 v0, 0x2

    if-eq p2, v0, :cond_45

    const/4 v0, 0x3

    if-ne p2, v0, :cond_1b

    .line 236
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->c()I

    move-result p1

    return p1

    .line 237
    :cond_1b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Unknown value set for night mode. Please use one of the MODE_NIGHT values from AppCompatDelegate."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 238
    :cond_23
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p2, v0, :cond_3c

    .line 239
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    const-string v0, "uimode"

    .line 240
    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/UiModeManager;

    .line 241
    invoke-virtual {p2}, Landroid/app/UiModeManager;->getNightMode()I

    move-result p2

    if-nez p2, :cond_3c

    return v1

    .line 242
    :cond_3c
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->d(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->c()I

    move-result p1

    return p1

    :cond_45
    return p2

    :cond_46
    return v1
.end method

.method public final a(Lb/h/m/g0;Landroid/graphics/Rect;)I
    .registers 13

    const/4 v0, 0x0

    if-eqz p1, :cond_8

    .line 173
    invoke-virtual {p1}, Lb/h/m/g0;->h()I

    move-result v1

    goto :goto_e

    :cond_8
    if-eqz p2, :cond_d

    .line 174
    iget v1, p2, Landroid/graphics/Rect;->top:I

    goto :goto_e

    :cond_d
    const/4 v1, 0x0

    .line 175
    :goto_e
    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/16 v3, 0x8

    if-eqz v2, :cond_111

    .line 176
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_111

    .line 177
    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    .line 178
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 179
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->isShown()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_ff

    .line 180
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->e0:Landroid/graphics/Rect;

    if-nez v4, :cond_3f

    .line 181
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->e0:Landroid/graphics/Rect;

    .line 182
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->f0:Landroid/graphics/Rect;

    .line 183
    :cond_3f
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->e0:Landroid/graphics/Rect;

    .line 184
    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->f0:Landroid/graphics/Rect;

    if-nez p1, :cond_49

    .line 185
    invoke-virtual {v4, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto :goto_5c

    .line 186
    :cond_49
    invoke-virtual {p1}, Lb/h/m/g0;->f()I

    move-result p2

    .line 187
    invoke-virtual {p1}, Lb/h/m/g0;->h()I

    move-result v7

    .line 188
    invoke-virtual {p1}, Lb/h/m/g0;->g()I

    move-result v8

    .line 189
    invoke-virtual {p1}, Lb/h/m/g0;->e()I

    move-result p1

    .line 190
    invoke-virtual {v4, p2, v7, v8, p1}, Landroid/graphics/Rect;->set(IIII)V

    .line 191
    :goto_5c
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    invoke-static {p1, v4, v6}, Lb/b/q/m0;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 192
    iget p1, v4, Landroid/graphics/Rect;->top:I

    .line 193
    iget p2, v4, Landroid/graphics/Rect;->left:I

    .line 194
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 195
    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    invoke-static {v6}, Lb/h/m/y;->z(Landroid/view/View;)Lb/h/m/g0;

    move-result-object v6

    if-nez v6, :cond_71

    const/4 v7, 0x0

    goto :goto_75

    .line 196
    :cond_71
    invoke-virtual {v6}, Lb/h/m/g0;->f()I

    move-result v7

    :goto_75
    if-nez v6, :cond_79

    const/4 v6, 0x0

    goto :goto_7d

    .line 197
    :cond_79
    invoke-virtual {v6}, Lb/h/m/g0;->g()I

    move-result v6

    .line 198
    :goto_7d
    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v8, p1, :cond_8c

    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v8, p2, :cond_8c

    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v8, v4, :cond_8a

    goto :goto_8c

    :cond_8a
    const/4 p2, 0x0

    goto :goto_93

    .line 199
    :cond_8c
    :goto_8c
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 200
    iput p2, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 201
    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    const/4 p2, 0x1

    :goto_93
    if-lez p1, :cond_bb

    .line 202
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    if-nez p1, :cond_bb

    .line 203
    new-instance p1, Landroid/view/View;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-direct {p1, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    .line 204
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 205
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/16 v8, 0x33

    const/4 v9, -0x1

    invoke-direct {p1, v9, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 206
    iput v7, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 207
    iput v6, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 208
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    invoke-virtual {v4, v6, v9, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_e0

    .line 209
    :cond_bb
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    if-eqz p1, :cond_e0

    .line 210
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 211
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    iget v8, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-ne v4, v8, :cond_d3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v4, v7, :cond_d3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v4, v6, :cond_e0

    .line 212
    :cond_d3
    iget v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 213
    iput v7, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 214
    iput v6, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 215
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    invoke-virtual {v4, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    :cond_e0
    :goto_e0
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    if-eqz p1, :cond_e5

    goto :goto_e6

    :cond_e5
    const/4 v5, 0x0

    :goto_e6
    if-eqz v5, :cond_f5

    .line 217
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_f5

    .line 218
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroid/view/View;)V

    .line 219
    :cond_f5
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->J:Z

    if-nez p1, :cond_fc

    if-eqz v5, :cond_fc

    const/4 v1, 0x0

    :cond_fc
    move p1, v5

    move v5, p2

    goto :goto_109

    .line 220
    :cond_ff
    iget p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eqz p1, :cond_107

    .line 221
    iput v0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    const/4 p1, 0x0

    goto :goto_109

    :cond_107
    const/4 p1, 0x0

    const/4 v5, 0x0

    :goto_109
    if-eqz v5, :cond_112

    .line 222
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_112

    :cond_111
    const/4 p1, 0x0

    .line 223
    :cond_112
    :goto_112
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->E:Landroid/view/View;

    if-eqz p2, :cond_11e

    if-eqz p1, :cond_119

    goto :goto_11b

    :cond_119
    const/16 v0, 0x8

    .line 224
    :goto_11b
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_11e
    return v1
.end method

.method public final a(Landroid/content/Context;ILandroid/content/res/Configuration;)Landroid/content/res/Configuration;
    .registers 5

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1a

    const/4 v0, 0x2

    if-eq p2, v0, :cond_17

    .line 243
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    .line 244
    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    goto :goto_1c

    :cond_17
    const/16 p1, 0x20

    goto :goto_1c

    :cond_1a
    const/16 p1, 0x10

    .line 245
    :goto_1c
    new-instance p2, Landroid/content/res/Configuration;

    invoke-direct {p2}, Landroid/content/res/Configuration;-><init>()V

    const/4 v0, 0x0

    .line 246
    iput v0, p2, Landroid/content/res/Configuration;->fontScale:F

    if-eqz p3, :cond_29

    .line 247
    invoke-virtual {p2, p3}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 248
    :cond_29
    iget p3, p2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p3, p3, -0x31

    or-int/2addr p1, p3

    iput p1, p2, Landroid/content/res/Configuration;->uiMode:I

    return-object p2
.end method

.method public a(I)Landroid/view/View;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 11
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 12
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0, p1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 16

    .line 72
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->g0:Lb/b/k/e;

    const/4 v1, 0x0

    if-nez v0, :cond_55

    .line 73
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    sget-object v2, Lb/b/j;->AppCompatTheme:[I

    invoke-virtual {v0, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 74
    sget v2, Lb/b/j;->AppCompatTheme_viewInflaterClass:I

    .line 75
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1d

    .line 76
    new-instance v0, Lb/b/k/e;

    invoke-direct {v0}, Lb/b/k/e;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->g0:Lb/b/k/e;

    goto :goto_55

    .line 77
    :cond_1d
    :try_start_1d
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Class;

    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/b/k/e;

    iput-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->g0:Lb/b/k/e;
    :try_end_31
    .catchall {:try_start_1d .. :try_end_31} :catchall_32

    goto :goto_55

    :catchall_32
    move-exception v2

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to instantiate custom view inflater "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ". Falling back to default."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "AppCompatDelegate"

    invoke-static {v3, v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    new-instance v0, Lb/b/k/e;

    invoke-direct {v0}, Lb/b/k/e;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->g0:Lb/b/k/e;

    .line 82
    :cond_55
    :goto_55
    sget-boolean v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->j0:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_88

    .line 83
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->h0:Lb/b/k/f;

    if-nez v0, :cond_65

    .line 84
    new-instance v0, Lb/b/k/f;

    invoke-direct {v0}, Lb/b/k/f;-><init>()V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->h0:Lb/b/k/f;

    .line 85
    :cond_65
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->h0:Lb/b/k/f;

    invoke-virtual {v0, p4}, Lb/b/k/f;->a(Landroid/util/AttributeSet;)Z

    move-result v0

    if-eqz v0, :cond_6f

    const/4 v7, 0x1

    goto :goto_89

    .line 86
    :cond_6f
    instance-of v0, p4, Lorg/xmlpull/v1/XmlPullParser;

    if-eqz v0, :cond_7e

    .line 87
    move-object v0, p4

    check-cast v0, Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    if-le v0, v2, :cond_86

    const/4 v1, 0x1

    goto :goto_86

    .line 88
    :cond_7e
    move-object v0, p1

    check-cast v0, Landroid/view/ViewParent;

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/ViewParent;)Z

    move-result v0

    move v1, v0

    :cond_86
    :goto_86
    move v7, v1

    goto :goto_89

    :cond_88
    const/4 v7, 0x0

    .line 89
    :goto_89
    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->g0:Lb/b/k/e;

    sget-boolean v8, Landroidx/appcompat/app/AppCompatDelegateImpl;->j0:Z

    const/4 v9, 0x1

    .line 90
    invoke-static {}, Lb/b/q/l0;->b()Z

    move-result v10

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    .line 91
    invoke-virtual/range {v2 .. v10}, Lb/b/k/e;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZZZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;
    .registers 6

    .line 162
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->N:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-eqz p2, :cond_7

    array-length v0, p2

    if-gt v0, p1, :cond_15

    :cond_7
    add-int/lit8 v0, p1, 0x1

    .line 163
    new-array v0, v0, [Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-eqz p2, :cond_12

    .line 164
    array-length v1, p2

    const/4 v2, 0x0

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    :cond_12
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->N:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-object p2, v0

    .line 166
    :cond_15
    aget-object v0, p2, p1

    if-nez v0, :cond_20

    .line 167
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;-><init>(I)V

    aput-object v0, p2, p1

    :cond_20
    return-object v0
.end method

.method public a(Landroid/view/Menu;)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;
    .registers 7

    .line 158
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->N:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    .line 159
    array-length v2, v0

    goto :goto_8

    :cond_7
    const/4 v2, 0x0

    :goto_8
    if-ge v1, v2, :cond_16

    .line 160
    aget-object v3, v0, v1

    if-eqz v3, :cond_13

    .line 161
    iget-object v4, v3, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-ne v4, p1, :cond_13

    return-object v3

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_16
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Lb/b/p/b$a;)Lb/b/p/b;
    .registers 4

    if-eqz p1, :cond_30

    .line 51
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    if-eqz v0, :cond_9

    .line 52
    invoke-virtual {v0}, Lb/b/p/b;->a()V

    .line 53
    :cond_9
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$i;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Lb/b/p/b$a;)V

    .line 54
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_23

    .line 55
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->a(Lb/b/p/b$a;)Lb/b/p/b;

    move-result-object p1

    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    if-eqz p1, :cond_23

    .line 56
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->o:Lb/b/k/b;

    if-eqz v1, :cond_23

    .line 57
    invoke-interface {v1, p1}, Lb/b/k/b;->a(Lb/b/p/b;)V

    .line 58
    :cond_23
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    if-nez p1, :cond_2d

    .line 59
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Lb/b/p/b$a;)Lb/b/p/b;

    move-result-object p1

    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    .line 60
    :cond_2d
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    return-object p1

    .line 61
    :cond_30
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ActionMode callback can not be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(ILandroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/Menu;)V
    .registers 6

    if-nez p3, :cond_11

    if-nez p2, :cond_d

    if-ltz p1, :cond_d

    .line 152
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->N:[Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    array-length v1, v0

    if-ge p1, v1, :cond_d

    .line 153
    aget-object p2, v0, p1

    :cond_d
    if-eqz p2, :cond_11

    .line 154
    iget-object p3, p2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    :cond_11
    if-eqz p2, :cond_18

    .line 155
    iget-boolean p2, p2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-nez p2, :cond_18

    return-void

    .line 156
    :cond_18
    iget-boolean p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez p2, :cond_25

    .line 157
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {p2}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object p2

    invoke-interface {p2, p1, p3}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    :cond_25
    return-void
.end method

.method public final a(IZLandroid/content/res/Configuration;)V
    .registers 7

    .line 249
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 250
    new-instance v1, Landroid/content/res/Configuration;

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    if-eqz p3, :cond_14

    .line 251
    invoke-virtual {v1, p3}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    .line 252
    :cond_14
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p3, p3, -0x31

    or-int/2addr p1, p3

    iput p1, v1, Landroid/content/res/Configuration;->uiMode:I

    const/4 p1, 0x0

    .line 253
    invoke-virtual {v0, v1, p1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 254
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x1a

    if-ge p1, p3, :cond_2c

    .line 255
    invoke-static {v0}, Lb/b/k/g;->a(Landroid/content/res/Resources;)V

    .line 256
    :cond_2c
    iget p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->V:I

    if-eqz p1, :cond_47

    .line 257
    iget-object p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p3, p1}, Landroid/content/Context;->setTheme(I)V

    .line 258
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x17

    if-lt p1, p3, :cond_47

    .line 259
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    iget p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->V:I

    const/4 v0, 0x1

    invoke-virtual {p1, p3, v0}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    :cond_47
    if-eqz p2, :cond_73

    .line 260
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_73

    .line 261
    check-cast p1, Landroid/app/Activity;

    .line 262
    instance-of p2, p1, Lb/n/h;

    if-eqz p2, :cond_6c

    .line 263
    move-object p2, p1

    check-cast p2, Lb/n/h;

    invoke-interface {p2}, Lb/n/h;->a()Lb/n/e;

    move-result-object p2

    .line 264
    invoke-virtual {p2}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object p2

    sget-object p3, Lb/n/e$c;->STARTED:Lb/n/e$c;

    invoke-virtual {p2, p3}, Lb/n/e$c;->isAtLeast(Lb/n/e$c;)Z

    move-result p2

    if-eqz p2, :cond_73

    .line 265
    invoke-virtual {p1, v1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_73

    .line 266
    :cond_6c
    iget-boolean p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->S:Z

    if-eqz p2, :cond_73

    .line 267
    invoke-virtual {p1, v1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_73
    :goto_73
    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 3

    .line 13
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->B:Z

    if-eqz v0, :cond_11

    .line 14
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 15
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->a(Landroid/content/res/Configuration;)V

    .line 16
    :cond_11
    invoke-static {}, Lb/b/q/f;->b()Lb/b/q/f;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lb/b/q/f;->a(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Z)Z

    return-void
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 4

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Q:Z

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Z)Z

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->s()V

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2a

    const/4 v1, 0x0

    .line 5
    :try_start_11
    check-cast v0, Landroid/app/Activity;

    invoke-static {v0}, Lb/h/d/d;->b(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1
    :try_end_17
    .catch Ljava/lang/IllegalArgumentException; {:try_start_11 .. :try_end_17} :catch_18

    goto :goto_19

    :catch_18
    nop

    :goto_19
    if-eqz v1, :cond_27

    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-nez v0, :cond_24

    .line 7
    iput-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->d0:Z

    goto :goto_27

    .line 8
    :cond_24
    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->c(Z)V

    .line 9
    :cond_27
    :goto_27
    invoke-static {p0}, Lb/b/k/c;->a(Lb/b/k/c;)V

    .line 10
    :cond_2a
    iput-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->R:Z

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 4

    .line 18
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 19
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 22
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {p1}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/Window$Callback;->onContentChanged()V

    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5

    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 24
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {p1}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/Window$Callback;->onContentChanged()V

    return-void
.end method

.method public a(Landroid/view/ViewGroup;)V
    .registers 2

    return-void
.end method

.method public final a(Landroid/view/Window;)V
    .registers 5

    .line 27
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    const-string v1, "AppCompat has already installed itself into the Window"

    if-nez v0, :cond_37

    .line 28
    invoke-virtual {p1}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    .line 29
    instance-of v2, v0, Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    if-nez v2, :cond_31

    .line 30
    new-instance v1, Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-direct {v1, p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$n;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Landroid/view/Window$Callback;)V

    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    .line 31
    invoke-virtual {p1, v1}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 32
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    const/4 v1, 0x0

    sget-object v2, Landroidx/appcompat/app/AppCompatDelegateImpl;->k0:[I

    invoke-static {v0, v1, v2}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object v0

    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Lb/b/q/g0;->c(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_2b

    .line 34
    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    :cond_2b
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    .line 36
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    return-void

    .line 37
    :cond_31
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 38
    :cond_37
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)V
    .registers 16

    .line 96
    iget-boolean v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-nez v0, :cond_f3

    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-eqz v0, :cond_a

    goto/16 :goto_f3

    .line 97
    :cond_a
    iget v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_27

    .line 98
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 99
    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v3, 0x4

    if-ne v0, v3, :cond_23

    const/4 v0, 0x1

    goto :goto_24

    :cond_23
    const/4 v0, 0x0

    :goto_24
    if-eqz v0, :cond_27

    return-void

    .line 100
    :cond_27
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_3b

    .line 101
    iget v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-interface {v0, v3, v4}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 102
    invoke-virtual {p0, p1, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    return-void

    .line 103
    :cond_3b
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    if-nez v0, :cond_48

    return-void

    .line 104
    :cond_48
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result p2

    if-nez p2, :cond_4f

    return-void

    .line 105
    :cond_4f
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    const/4 v3, -0x1

    const/4 v4, -0x2

    if-eqz p2, :cond_6a

    iget-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    if-eqz p2, :cond_5a

    goto :goto_6a

    .line 106
    :cond_5a
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    if-eqz p2, :cond_ce

    .line 107
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    if-eqz p2, :cond_ce

    .line 108
    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne p2, v3, :cond_ce

    const/4 v6, -0x1

    goto :goto_cf

    .line 109
    :cond_6a
    :goto_6a
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    if-nez p2, :cond_79

    .line 110
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z

    move-result p2

    if-eqz p2, :cond_78

    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    if-nez p2, :cond_88

    :cond_78
    return-void

    .line 111
    :cond_79
    iget-boolean v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    if-eqz v3, :cond_88

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    if-lez p2, :cond_88

    .line 112
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 113
    :cond_88
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z

    move-result p2

    if-eqz p2, :cond_f1

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a()Z

    move-result p2

    if-nez p2, :cond_95

    goto :goto_f1

    .line 114
    :cond_95
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    if-nez p2, :cond_a2

    .line 115
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p2, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 116
    :cond_a2
    iget v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->b:I

    .line 117
    iget-object v5, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 118
    iget-object v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 119
    instance-of v5, v3, Landroid/view/ViewGroup;

    if-eqz v5, :cond_ba

    .line 120
    check-cast v3, Landroid/view/ViewGroup;

    iget-object v5, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 121
    :cond_ba
    iget-object v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    iget-object v5, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {v3, v5, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->hasFocus()Z

    move-result p2

    if-nez p2, :cond_ce

    .line 123
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->requestFocus()Z

    :cond_ce
    const/4 v6, -0x2

    .line 124
    :goto_cf
    iput-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->n:Z

    .line 125
    new-instance p2, Landroid/view/WindowManager$LayoutParams;

    const/4 v7, -0x2

    iget v8, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->d:I

    iget v9, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->e:I

    const/16 v10, 0x3ea

    const/high16 v11, 0x820000

    const/4 v12, -0x3

    move-object v5, p2

    invoke-direct/range {v5 .. v12}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    .line 126
    iget v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->c:I

    iput v1, p2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 127
    iget v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->f:I

    iput v1, p2, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 128
    iget-object v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    invoke-interface {v0, v1, p2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    iput-boolean v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    return-void

    .line 130
    :cond_f1
    :goto_f1
    iput-boolean v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    :cond_f3
    :goto_f3
    return-void
.end method

.method public a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V
    .registers 6

    if-eqz p2, :cond_16

    .line 138
    iget v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    if-nez v0, :cond_16

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v0, :cond_16

    .line 139
    invoke-interface {v0}, Lb/b/q/o;->b()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 140
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Lb/b/p/j/g;)V

    return-void

    .line 141
    :cond_16
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_35

    .line 142
    iget-boolean v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-eqz v2, :cond_35

    iget-object v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    if-eqz v2, :cond_35

    .line 143
    invoke-interface {v0, v2}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    if-eqz p2, :cond_35

    .line 144
    iget p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    invoke-virtual {p0, p2, p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(ILandroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/Menu;)V

    :cond_35
    const/4 p2, 0x0

    .line 145
    iput-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    .line 146
    iput-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->n:Z

    .line 147
    iput-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    .line 148
    iput-object v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    const/4 p2, 0x1

    .line 149
    iput-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    .line 150
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-ne p2, p1, :cond_47

    .line 151
    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    :cond_47
    return-void
.end method

.method public a(Lb/b/p/j/g;)V
    .registers 2

    const/4 p1, 0x1

    .line 50
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Z)V

    return-void
.end method

.method public final a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 39
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->r:Ljava/lang/CharSequence;

    .line 40
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v0, :cond_a

    .line 41
    invoke-interface {v0, p1}, Lb/b/q/o;->setWindowTitle(Ljava/lang/CharSequence;)V

    goto :goto_1f

    .line 42
    :cond_a
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 43
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/ActionBar;->a(Ljava/lang/CharSequence;)V

    goto :goto_1f

    .line 44
    :cond_18
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->D:Landroid/widget/TextView;

    if-eqz v0, :cond_1f

    .line 45
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1f
    :goto_1f
    return-void
.end method

.method public a(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/4 v0, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_e

    const/16 v0, 0x52

    if-eq p1, v0, :cond_a

    goto :goto_1a

    .line 70
    :cond_a
    invoke-virtual {p0, v2, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(ILandroid/view/KeyEvent;)Z

    return v1

    .line 71
    :cond_e
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result p1

    and-int/lit16 p1, p1, 0x80

    if-eqz p1, :cond_17

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    iput-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->P:Z

    :goto_1a
    return v2
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 5

    .line 62
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Lb/h/m/f$a;

    const/4 v2, 0x1

    if-nez v1, :cond_b

    instance-of v0, v0, Lb/b/k/d;

    if-eqz v0, :cond_1a

    .line 63
    :cond_b
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 64
    invoke-static {v0, p1}, Lb/h/m/f;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1a

    return v2

    .line 65
    :cond_1a
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x52

    if-ne v0, v1, :cond_2f

    .line 66
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {v0}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_2f

    return v2

    .line 67
    :cond_2f
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 68
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_3a

    goto :goto_3b

    :cond_3a
    const/4 v2, 0x0

    :goto_3b
    if-eqz v2, :cond_42

    .line 69
    invoke-virtual {p0, v0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(ILandroid/view/KeyEvent;)Z

    move-result p1

    goto :goto_46

    :cond_42
    invoke-virtual {p0, v0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->d(ILandroid/view/KeyEvent;)Z

    move-result p1

    :goto_46
    return p1
.end method

.method public final a(Landroid/view/ViewParent;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 92
    :cond_4
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    :goto_a
    if-nez p1, :cond_e

    const/4 p1, 0x1

    return p1

    :cond_e
    if-eq p1, v1, :cond_23

    .line 93
    instance-of v2, p1, Landroid/view/View;

    if-eqz v2, :cond_23

    move-object v2, p1

    check-cast v2, Landroid/view/View;

    .line 94
    invoke-static {v2}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_1e

    goto :goto_23

    .line 95
    :cond_1e
    invoke-interface {p1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    goto :goto_a

    :cond_23
    :goto_23
    return v0
.end method

.method public final a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z
    .registers 5

    .line 131
    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    .line 132
    iput-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    return v1

    .line 133
    :cond_8
    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    const/4 v2, 0x0

    if-nez v0, :cond_e

    return v2

    .line 134
    :cond_e
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->u:Landroidx/appcompat/app/AppCompatDelegateImpl$t;

    if-nez v0, :cond_19

    .line 135
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$t;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$t;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->u:Landroidx/appcompat/app/AppCompatDelegateImpl$t;

    .line 136
    :cond_19
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->u:Landroidx/appcompat/app/AppCompatDelegateImpl$t;

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a(Lb/b/p/j/m$a;)Lb/b/p/j/n;

    move-result-object v0

    .line 137
    check-cast v0, Landroid/view/View;

    iput-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->h:Landroid/view/View;

    if-eqz v0, :cond_26

    goto :goto_27

    :cond_26
    const/4 v1, 0x0

    :goto_27
    return v1
.end method

.method public final a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;ILandroid/view/KeyEvent;I)Z
    .registers 7

    .line 168
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isSystem()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    .line 169
    :cond_8
    iget-boolean v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    if-nez v0, :cond_12

    invoke-virtual {p0, p1, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_12
    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-eqz v0, :cond_1a

    .line 170
    invoke-virtual {v0, p2, p3, p4}, Lb/b/p/j/g;->performShortcut(ILandroid/view/KeyEvent;I)Z

    move-result v1

    :cond_1a
    if-eqz v1, :cond_28

    const/4 p2, 0x1

    and-int/lit8 p3, p4, 0x1

    if-nez p3, :cond_28

    .line 171
    iget-object p3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-nez p3, :cond_28

    .line 172
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    :cond_28
    return v1
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 5

    .line 46
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 47
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez v1, :cond_1b

    .line 48
    invoke-virtual {p1}, Lb/b/p/j/g;->m()Lb/b/p/j/g;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/Menu;)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    if-eqz p1, :cond_1b

    .line 49
    iget p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_1b
    const/4 p1, 0x0

    return p1
.end method

.method public final a(Z)Z
    .registers 4

    .line 225
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-eqz v0, :cond_6

    const/4 p1, 0x0

    return p1

    .line 226
    :cond_6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->m()I

    move-result v0

    .line 227
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p0, v1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;I)I

    move-result v1

    .line 228
    invoke-virtual {p0, v1, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(IZ)Z

    move-result p1

    if-nez v0, :cond_20

    .line 229
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->d(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->e()V

    goto :goto_27

    .line 230
    :cond_20
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-eqz v1, :cond_27

    .line 231
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->a()V

    :cond_27
    :goto_27
    const/4 v1, 0x3

    if-ne v0, v1, :cond_34

    .line 232
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->e()V

    goto :goto_3b

    .line 233
    :cond_34
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-eqz v0, :cond_3b

    .line 234
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->a()V

    :cond_3b
    :goto_3b
    return p1
.end method

.method public b(Landroid/content/Context;)Landroid/content/Context;
    .registers 8

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Q:Z

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->m()I

    move-result v1

    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;I)I

    move-result v1

    .line 3
    sget-boolean v2, Landroidx/appcompat/app/AppCompatDelegateImpl;->m0:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_20

    instance-of v2, p1, Landroid/view/ContextThemeWrapper;

    if-eqz v2, :cond_20

    .line 4
    invoke-virtual {p0, p1, v1, v3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;ILandroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v2

    .line 5
    :try_start_18
    move-object v4, p1

    check-cast v4, Landroid/view/ContextThemeWrapper;

    invoke-static {v4, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl$r;->a(Landroid/view/ContextThemeWrapper;Landroid/content/res/Configuration;)V
    :try_end_1e
    .catch Ljava/lang/IllegalStateException; {:try_start_18 .. :try_end_1e} :catch_1f

    return-object p1

    :catch_1f
    nop

    .line 6
    :cond_20
    instance-of v2, p1, Lb/b/p/d;

    if-eqz v2, :cond_30

    .line 7
    invoke-virtual {p0, p1, v1, v3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;ILandroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v2

    .line 8
    :try_start_28
    move-object v4, p1

    check-cast v4, Lb/b/p/d;

    invoke-virtual {v4, v2}, Lb/b/p/d;->a(Landroid/content/res/Configuration;)V
    :try_end_2e
    .catch Ljava/lang/IllegalStateException; {:try_start_28 .. :try_end_2e} :catch_2f

    return-object p1

    :catch_2f
    nop

    .line 9
    :cond_30
    sget-boolean v2, Landroidx/appcompat/app/AppCompatDelegateImpl;->l0:Z

    if-nez v2, :cond_38

    .line 10
    invoke-super {p0, p1}, Lb/b/k/c;->b(Landroid/content/Context;)Landroid/content/Context;

    return-object p1

    .line 11
    :cond_38
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v2, v4, :cond_6b

    .line 12
    new-instance v2, Landroid/content/res/Configuration;

    invoke-direct {v2}, Landroid/content/res/Configuration;-><init>()V

    const/4 v4, -0x1

    .line 13
    iput v4, v2, Landroid/content/res/Configuration;->uiMode:I

    const/4 v4, 0x0

    .line 14
    iput v4, v2, Landroid/content/res/Configuration;->fontScale:F

    .line 15
    invoke-static {p1, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl$j;->a(Landroid/content/Context;Landroid/content/res/Configuration;)Landroid/content/Context;

    move-result-object v2

    .line 16
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    .line 18
    iget v5, v4, Landroid/content/res/Configuration;->uiMode:I

    iput v5, v2, Landroid/content/res/Configuration;->uiMode:I

    .line 19
    invoke-virtual {v2, v4}, Landroid/content/res/Configuration;->equals(Landroid/content/res/Configuration;)Z

    move-result v5

    if-nez v5, :cond_6b

    .line 20
    invoke-static {v2, v4}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v3

    .line 21
    :cond_6b
    invoke-virtual {p0, p1, v1, v3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;ILandroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v1

    .line 22
    new-instance v2, Lb/b/p/d;

    sget v3, Lb/b/i;->Theme_AppCompat_Empty:I

    invoke-direct {v2, p1, v3}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    .line 23
    invoke-virtual {v2, v1}, Lb/b/p/d;->a(Landroid/content/res/Configuration;)V

    const/4 v1, 0x0

    .line 24
    :try_start_7a
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1
    :try_end_7e
    .catch Ljava/lang/NullPointerException; {:try_start_7a .. :try_end_7e} :catch_84

    if-eqz p1, :cond_81

    goto :goto_82

    :cond_81
    const/4 v0, 0x0

    :goto_82
    move v1, v0

    goto :goto_85

    :catch_84
    nop

    :goto_85
    if-eqz v1, :cond_8e

    .line 25
    invoke-virtual {v2}, Lb/b/p/d;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    invoke-static {p1}, Lb/h/e/c/f$b;->a(Landroid/content/res/Resources$Theme;)V

    .line 26
    :cond_8e
    invoke-super {p0, v2}, Lb/b/k/c;->b(Landroid/content/Context;)Landroid/content/Context;

    return-object v2
.end method

.method public b()Landroid/view/MenuInflater;
    .registers 3

    .line 28
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->q:Landroid/view/MenuInflater;

    if-nez v0, :cond_19

    .line 29
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->w()V

    .line 30
    new-instance v0, Lb/b/p/g;

    .line 31
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Landroidx/appcompat/app/ActionBar;->h()Landroid/content/Context;

    move-result-object v1

    goto :goto_14

    :cond_12
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    :goto_14
    invoke-direct {v0, v1}, Lb/b/p/g;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->q:Landroid/view/MenuInflater;

    .line 32
    :cond_19
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->q:Landroid/view/MenuInflater;

    return-object v0
.end method

.method public b(Lb/b/p/b$a;)Lb/b/p/b;
    .registers 9

    .line 55
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->q()V

    .line 56
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    if-eqz v0, :cond_a

    .line 57
    invoke-virtual {v0}, Lb/b/p/b;->a()V

    .line 58
    :cond_a
    instance-of v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$i;

    if-nez v0, :cond_14

    .line 59
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$i;

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$i;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Lb/b/p/b$a;)V

    move-object p1, v0

    .line 60
    :cond_14
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->o:Lb/b/k/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez v2, :cond_22

    .line 61
    :try_start_1d
    invoke-interface {v0, p1}, Lb/b/k/b;->a(Lb/b/p/b$a;)Lb/b/p/b;

    move-result-object v0
    :try_end_21
    .catch Ljava/lang/AbstractMethodError; {:try_start_1d .. :try_end_21} :catch_22

    goto :goto_23

    :catch_22
    :cond_22
    move-object v0, v1

    :goto_23
    if-eqz v0, :cond_29

    .line 62
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    goto/16 :goto_161

    .line 63
    :cond_29
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_d4

    .line 64
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->K:Z

    if-eqz v0, :cond_b5

    .line 65
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 66
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    .line 67
    sget v5, Lb/b/a;->actionBarTheme:I

    invoke-virtual {v4, v5, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 68
    iget v5, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_68

    .line 69
    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    .line 70
    invoke-virtual {v5, v4}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 71
    iget v4, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v5, v4, v3}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 72
    new-instance v4, Lb/b/p/d;

    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-direct {v4, v6, v2}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    .line 73
    invoke-virtual {v4}, Lb/b/p/d;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    goto :goto_6a

    .line 74
    :cond_68
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 75
    :goto_6a
    new-instance v5, Landroidx/appcompat/widget/ActionBarContextView;

    invoke-direct {v5, v4}, Landroidx/appcompat/widget/ActionBarContextView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    .line 76
    new-instance v5, Landroid/widget/PopupWindow;

    sget v6, Lb/b/a;->actionModePopupWindowStyle:I

    invoke-direct {v5, v4, v1, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    const/4 v6, 0x2

    .line 77
    invoke-static {v5, v6}, Lb/h/n/h;->a(Landroid/widget/PopupWindow;I)V

    .line 78
    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 79
    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 80
    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    sget v6, Lb/b/a;->actionBarSize:I

    invoke-virtual {v5, v6, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 81
    iget v0, v0, Landroid/util/TypedValue;->data:I

    .line 82
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 83
    invoke-static {v0, v4}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v0

    .line 84
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v4, v0}, Landroidx/appcompat/widget/ActionBarContextView;->setContentHeight(I)V

    .line 85
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    const/4 v4, -0x2

    invoke-virtual {v0, v4}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 86
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$f;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$f;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->y:Ljava/lang/Runnable;

    goto :goto_d4

    .line 87
    :cond_b5
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    sget v4, Lb/b/f;->action_mode_bar_stub:I

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ViewStubCompat;

    if-eqz v0, :cond_d4

    .line 88
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->t()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroidx/appcompat/widget/ViewStubCompat;->setLayoutInflater(Landroid/view/LayoutInflater;)V

    .line 89
    invoke-virtual {v0}, Landroidx/appcompat/widget/ViewStubCompat;->a()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ActionBarContextView;

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    .line 90
    :cond_d4
    :goto_d4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v0, :cond_161

    .line 91
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->q()V

    .line 92
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->d()V

    .line 93
    new-instance v0, Lb/b/p/e;

    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    if-nez v6, :cond_ef

    goto :goto_f0

    :cond_ef
    const/4 v3, 0x0

    :goto_f0
    invoke-direct {v0, v4, v5, p1, v3}, Lb/b/p/e;-><init>(Landroid/content/Context;Landroidx/appcompat/widget/ActionBarContextView;Lb/b/p/b$a;Z)V

    .line 94
    invoke-virtual {v0}, Lb/b/p/e;->c()Landroid/view/Menu;

    move-result-object v3

    invoke-interface {p1, v0, v3}, Lb/b/p/b$a;->b(Lb/b/p/b;Landroid/view/Menu;)Z

    move-result p1

    if-eqz p1, :cond_15f

    .line 95
    invoke-virtual {v0}, Lb/b/p/e;->i()V

    .line 96
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContextView;->a(Lb/b/p/b;)V

    .line 97
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    .line 98
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->B()Z

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_129

    .line 99
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 100
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-static {p1}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object p1

    invoke-virtual {p1, v0}, Lb/h/m/c0;->a(F)Lb/h/m/c0;

    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    .line 101
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$g;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$g;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    invoke-virtual {p1, v0}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    goto :goto_14f

    .line 102
    :cond_129
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 103
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    .line 104
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 105
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/View;

    if-eqz p1, :cond_14f

    .line 106
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->w:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Lb/h/m/y;->P(Landroid/view/View;)V

    .line 107
    :cond_14f
    :goto_14f
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_161

    .line 108
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->y:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_161

    .line 109
    :cond_15f
    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    .line 110
    :cond_161
    :goto_161
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    if-eqz p1, :cond_16c

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->o:Lb/b/k/b;

    if-eqz v0, :cond_16c

    .line 111
    invoke-interface {v0, p1}, Lb/b/k/b;->a(Lb/b/p/b;)V

    .line 112
    :cond_16c
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    return-object p1
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 2

    .line 27
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 4

    .line 189
    invoke-static {p1}, Lb/h/m/y;->D(Landroid/view/View;)I

    move-result v0

    and-int/lit16 v0, v0, 0x2000

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    if-eqz v0, :cond_16

    .line 190
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    sget v1, Lb/b/c;->abc_decor_view_status_guard_light:I

    invoke-static {v0, v1}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v0

    goto :goto_1e

    .line 191
    :cond_16
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    sget v1, Lb/b/c;->abc_decor_view_status_guard:I

    invoke-static {v0, v1}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v0

    .line 192
    :goto_1e
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public b(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5

    .line 33
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 34
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 35
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 36
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {p1}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/Window$Callback;->onContentChanged()V

    return-void
.end method

.method public b(Lb/b/p/j/g;)V
    .registers 4

    .line 178
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->M:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 179
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->M:Z

    .line 180
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {v0}, Lb/b/q/o;->g()V

    .line 181
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 182
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez v1, :cond_1c

    const/16 v1, 0x6c

    .line 183
    invoke-interface {v0, v1, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    :cond_1c
    const/4 p1, 0x0

    .line 184
    iput-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->M:Z

    return-void
.end method

.method public final b(Z)V
    .registers 7

    .line 116
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_82

    invoke-interface {v0}, Lb/b/q/o;->f()Z

    move-result v0

    if-eqz v0, :cond_82

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 117
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    .line 118
    invoke-interface {v0}, Lb/b/q/o;->a()Z

    move-result v0

    if-eqz v0, :cond_82

    .line 119
    :cond_20
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    .line 120
    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {v3}, Lb/b/q/o;->b()Z

    move-result v3

    const/16 v4, 0x6c

    if-eqz v3, :cond_44

    if-nez p1, :cond_31

    goto :goto_44

    .line 121
    :cond_31
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {p1}, Lb/b/q/o;->c()Z

    .line 122
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez p1, :cond_81

    .line 123
    invoke-virtual {p0, v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 124
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-interface {v0, v4, p1}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    goto :goto_81

    :cond_44
    :goto_44
    if-eqz v0, :cond_81

    .line 125
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez p1, :cond_81

    .line 126
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->a0:Z

    if-eqz p1, :cond_63

    iget p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->b0:I

    and-int/2addr p1, v1

    if-eqz p1, :cond_63

    .line 127
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->c0:Ljava/lang/Runnable;

    invoke-virtual {p1, v3}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 128
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->c0:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 129
    :cond_63
    invoke-virtual {p0, v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 130
    iget-object v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-eqz v1, :cond_81

    iget-boolean v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->r:Z

    if-nez v3, :cond_81

    iget-object v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    .line 131
    invoke-interface {v0, v2, v3, v1}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v1

    if-eqz v1, :cond_81

    .line 132
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-interface {v0, v4, p1}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 133
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {p1}, Lb/b/q/o;->d()Z

    :cond_81
    :goto_81
    return-void

    .line 134
    :cond_82
    invoke-virtual {p0, v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 135
    iput-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    .line 136
    invoke-virtual {p0, p1, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    const/4 v0, 0x0

    .line 137
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)V

    return-void
.end method

.method public b(I)Z
    .registers 6

    .line 38
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->j(I)I

    move-result p1

    .line 39
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->L:Z

    const/4 v1, 0x0

    const/16 v2, 0x6c

    if-eqz v0, :cond_e

    if-ne p1, v2, :cond_e

    return v1

    .line 40
    :cond_e
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    const/4 v3, 0x1

    if-eqz v0, :cond_17

    if-ne p1, v3, :cond_17

    .line 41
    iput-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    :cond_17
    if-eq p1, v3, :cond_4e

    const/4 v0, 0x2

    if-eq p1, v0, :cond_48

    const/4 v0, 0x5

    if-eq p1, v0, :cond_42

    const/16 v0, 0xa

    if-eq p1, v0, :cond_3c

    if-eq p1, v2, :cond_36

    const/16 v0, 0x6d

    if-eq p1, v0, :cond_30

    .line 42
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0, p1}, Landroid/view/Window;->requestFeature(I)Z

    move-result p1

    return p1

    .line 43
    :cond_30
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 44
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->I:Z

    return v3

    .line 45
    :cond_36
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 46
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    return v3

    .line 47
    :cond_3c
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 48
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->J:Z

    return v3

    .line 49
    :cond_42
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 50
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->G:Z

    return v3

    .line 51
    :cond_48
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 52
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->F:Z

    return v3

    .line 53
    :cond_4e
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->C()V

    .line 54
    iput-boolean v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->L:Z

    return v3
.end method

.method public final b(ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 185
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    .line 186
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 187
    iget-boolean v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-nez v0, :cond_14

    .line 188
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_14
    const/4 p1, 0x0

    return p1
.end method

.method public final b(IZ)Z
    .registers 9

    .line 193
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    const/4 v1, 0x0

    .line 194
    invoke-virtual {p0, v0, p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/content/Context;ILandroid/content/res/Configuration;)Landroid/content/res/Configuration;

    move-result-object v0

    .line 195
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->x()Z

    move-result v2

    .line 196
    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v3, v3, 0x30

    .line 197
    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/4 v4, 0x1

    if-eq v3, v0, :cond_47

    if-eqz p2, :cond_47

    if-nez v2, :cond_47

    .line 198
    iget-boolean p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Q:Z

    if-eqz p2, :cond_47

    sget-boolean p2, Landroidx/appcompat/app/AppCompatDelegateImpl;->l0:Z

    if-nez p2, :cond_30

    iget-boolean p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->R:Z

    if-eqz p2, :cond_47

    :cond_30
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v5, p2, Landroid/app/Activity;

    if-eqz v5, :cond_47

    check-cast p2, Landroid/app/Activity;

    .line 199
    invoke-virtual {p2}, Landroid/app/Activity;->isChild()Z

    move-result p2

    if-nez p2, :cond_47

    .line 200
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    check-cast p2, Landroid/app/Activity;

    invoke-static {p2}, Lb/h/d/a;->b(Landroid/app/Activity;)V

    const/4 p2, 0x1

    goto :goto_48

    :cond_47
    const/4 p2, 0x0

    :goto_48
    if-nez p2, :cond_50

    if-eq v3, v0, :cond_50

    .line 201
    invoke-virtual {p0, v0, v2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZLandroid/content/res/Configuration;)V

    goto :goto_51

    :cond_50
    move v4, p2

    :goto_51
    if-eqz v4, :cond_5e

    .line 202
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v0, p2, Landroidx/appcompat/app/AppCompatActivity;

    if-eqz v0, :cond_5e

    .line 203
    check-cast p2, Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {p2, p1}, Landroidx/appcompat/app/AppCompatActivity;->b(I)V

    :cond_5e
    return v4
.end method

.method public final b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z
    .registers 4

    .line 113
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->t()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a(Landroid/content/Context;)V

    .line 114
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$s;

    iget-object v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->l:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$s;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Landroid/content/Context;)V

    iput-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->g:Landroid/view/ViewGroup;

    const/16 v0, 0x51

    .line 115
    iput v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->c:I

    const/4 p1, 0x1

    return p1
.end method

.method public final b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z
    .registers 11

    .line 138
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    .line 139
    :cond_6
    iget-boolean v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    const/4 v2, 0x1

    if-eqz v0, :cond_c

    return v2

    .line 140
    :cond_c
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-eqz v0, :cond_15

    if-eq v0, p1, :cond_15

    .line 141
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    .line 142
    :cond_15
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v0

    if-eqz v0, :cond_23

    .line 143
    iget v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    invoke-interface {v0, v3}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    .line 144
    :cond_23
    iget v3, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    if-eqz v3, :cond_2e

    const/16 v4, 0x6c

    if-ne v3, v4, :cond_2c

    goto :goto_2e

    :cond_2c
    const/4 v3, 0x0

    goto :goto_2f

    :cond_2e
    :goto_2e
    const/4 v3, 0x1

    :goto_2f
    if-eqz v3, :cond_38

    .line 145
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v4, :cond_38

    .line 146
    invoke-interface {v4}, Lb/b/q/o;->e()V

    .line 147
    :cond_38
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    if-nez v4, :cond_df

    if-eqz v3, :cond_41

    .line 148
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    .line 149
    :cond_41
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    const/4 v5, 0x0

    if-eqz v4, :cond_4a

    iget-boolean v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->r:Z

    if-eqz v4, :cond_93

    .line 150
    :cond_4a
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-nez v4, :cond_59

    .line 151
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z

    move-result v4

    if-eqz v4, :cond_58

    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-nez v4, :cond_59

    :cond_58
    return v1

    :cond_59
    if-eqz v3, :cond_73

    .line 152
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v4, :cond_73

    .line 153
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    if-nez v4, :cond_6a

    .line 154
    new-instance v4, Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    invoke-direct {v4, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$h;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    iput-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    .line 155
    :cond_6a
    iget-object v4, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    iget-object v6, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    iget-object v7, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    invoke-interface {v4, v6, v7}, Lb/b/q/o;->a(Landroid/view/Menu;Lb/b/p/j/m$a;)V

    .line 156
    :cond_73
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v4}, Lb/b/p/j/g;->s()V

    .line 157
    iget v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    iget-object v6, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-interface {v0, v4, v6}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v4

    if-nez v4, :cond_91

    .line 158
    invoke-virtual {p1, v5}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a(Lb/b/p/j/g;)V

    if-eqz v3, :cond_90

    .line 159
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz p1, :cond_90

    .line 160
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    invoke-interface {p1, v5, p2}, Lb/b/q/o;->a(Landroid/view/Menu;Lb/b/p/j/m$a;)V

    :cond_90
    return v1

    .line 161
    :cond_91
    iput-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->r:Z

    .line 162
    :cond_93
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v4}, Lb/b/p/j/g;->s()V

    .line 163
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->s:Landroid/os/Bundle;

    if-eqz v4, :cond_a3

    .line 164
    iget-object v6, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v6, v4}, Lb/b/p/j/g;->c(Landroid/os/Bundle;)V

    .line 165
    iput-object v5, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->s:Landroid/os/Bundle;

    .line 166
    :cond_a3
    iget-object v4, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->i:Landroid/view/View;

    iget-object v6, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-interface {v0, v1, v4, v6}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    if-nez v0, :cond_be

    if-eqz v3, :cond_b8

    .line 167
    iget-object p2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz p2, :cond_b8

    .line 168
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->t:Landroidx/appcompat/app/AppCompatDelegateImpl$h;

    invoke-interface {p2, v5, v0}, Lb/b/q/o;->a(Landroid/view/Menu;Lb/b/p/j/m$a;)V

    .line 169
    :cond_b8
    iget-object p1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {p1}, Lb/b/p/j/g;->r()V

    return v1

    :cond_be
    if-eqz p2, :cond_c5

    .line 170
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result p2

    goto :goto_c6

    :cond_c5
    const/4 p2, -0x1

    .line 171
    :goto_c6
    invoke-static {p2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object p2

    .line 172
    invoke-virtual {p2}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    move-result p2

    if-eq p2, v2, :cond_d2

    const/4 p2, 0x1

    goto :goto_d3

    :cond_d2
    const/4 p2, 0x0

    :goto_d3
    iput-boolean p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->p:Z

    .line 173
    iget-object v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v0, p2}, Lb/b/p/j/g;->setQwertyMode(Z)V

    .line 174
    iget-object p2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {p2}, Lb/b/p/j/g;->r()V

    .line 175
    :cond_df
    iput-boolean v2, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    .line 176
    iput-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->n:Z

    .line 177
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    return v2
.end method

.method public c()Landroidx/appcompat/app/ActionBar;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->w()V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    return-object v0
.end method

.method public final c(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;
    .registers 3

    .line 39
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-nez v0, :cond_b

    .line 40
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$o;

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$o;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    .line 41
    :cond_b
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    return-object p1
.end method

.method public c(I)V
    .registers 4

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->n:Landroidx/appcompat/app/AppCompatDelegateImpl$n;

    invoke-virtual {p1}, Lb/b/p/i;->a()Landroid/view/Window$Callback;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/Window$Callback;->onContentChanged()V

    return-void
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public c(ILandroid/view/KeyEvent;)Z
    .registers 6

    .line 8
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_e

    .line 9
    invoke-virtual {v0, p1, p2}, Landroidx/appcompat/app/ActionBar;->a(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_e

    return v1

    .line 10
    :cond_e
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-eqz p1, :cond_23

    .line 11
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, p1, v0, p2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;ILandroid/view/KeyEvent;I)Z

    move-result p1

    if-eqz p1, :cond_23

    .line 12
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    if-eqz p1, :cond_22

    .line 13
    iput-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->n:Z

    :cond_22
    return v1

    .line 14
    :cond_23
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->O:Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    const/4 v0, 0x0

    if-nez p1, :cond_3c

    .line 15
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 16
    invoke-virtual {p0, p1, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    .line 17
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-virtual {p0, p1, v2, p2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;ILandroid/view/KeyEvent;I)Z

    move-result p2

    .line 18
    iput-boolean v0, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    if-eqz p2, :cond_3c

    return v1

    :cond_3c
    return v0
.end method

.method public final c(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;)Z
    .registers 8

    .line 19
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 20
    iget v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a:I

    const/4 v2, 0x1

    if-eqz v1, :cond_b

    const/16 v3, 0x6c

    if-ne v1, v3, :cond_63

    :cond_b
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v1, :cond_63

    .line 21
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 22
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    .line 23
    sget v4, Lb/b/a;->actionBarTheme:I

    invoke-virtual {v3, v4, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    const/4 v4, 0x0

    .line 24
    iget v5, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_38

    .line 25
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    .line 26
    invoke-virtual {v4, v3}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 27
    iget v5, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v5, v2}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 28
    sget v5, Lb/b/a;->actionBarWidgetTheme:I

    invoke-virtual {v4, v5, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    goto :goto_3d

    .line 29
    :cond_38
    sget v5, Lb/b/a;->actionBarWidgetTheme:I

    invoke-virtual {v3, v5, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 30
    :goto_3d
    iget v5, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_53

    if-nez v4, :cond_4e

    .line 31
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    .line 32
    invoke-virtual {v4, v3}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 33
    :cond_4e
    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v4, v1, v2}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    :cond_53
    if-eqz v4, :cond_63

    .line 34
    new-instance v1, Lb/b/p/d;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v3}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    .line 35
    invoke-virtual {v1}, Lb/b/p/d;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    move-object v0, v1

    .line 36
    :cond_63
    new-instance v1, Lb/b/p/j/g;

    invoke-direct {v1, v0}, Lb/b/p/j/g;-><init>(Landroid/content/Context;)V

    .line 37
    invoke-virtual {v1, p0}, Lb/b/p/j/g;->a(Lb/b/p/j/g$a;)V

    .line 38
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->a(Lb/b/p/j/g;)V

    return v2
.end method

.method public final d(Landroid/content/Context;)Landroidx/appcompat/app/AppCompatDelegateImpl$p;
    .registers 3

    .line 14
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-nez v0, :cond_f

    .line 15
    new-instance v0, Landroidx/appcompat/app/AppCompatDelegateImpl$q;

    .line 16
    invoke-static {p1}, Lb/b/k/i;->a(Landroid/content/Context;)Lb/b/k/i;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl$q;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;Lb/b/k/i;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    .line 17
    :cond_f
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    return-object p1
.end method

.method public d()V
    .registers 3

    .line 9
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/view/LayoutInflater;->getFactory()Landroid/view/LayoutInflater$Factory;

    move-result-object v1

    if-nez v1, :cond_10

    .line 11
    invoke-static {v0, p0}, Lb/h/m/g;->b(Landroid/view/LayoutInflater;Landroid/view/LayoutInflater$Factory2;)V

    goto :goto_1f

    .line 12
    :cond_10
    invoke-virtual {v0}, Landroid/view/LayoutInflater;->getFactory2()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    instance-of v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl;

    if-nez v0, :cond_1f

    const-string v0, "AppCompatDelegate"

    const-string v1, "The Activity\'s LayoutInflater already has a Factory installed so we can not install AppCompat\'s"

    .line 13
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1f
    :goto_1f
    return-void
.end method

.method public d(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->V:I

    return-void
.end method

.method public d(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/4 v0, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_e

    const/16 v0, 0x52

    if-eq p1, v0, :cond_a

    goto :goto_29

    .line 2
    :cond_a
    invoke-virtual {p0, v2, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->e(ILandroid/view/KeyEvent;)Z

    return v1

    .line 3
    :cond_e
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->P:Z

    .line 4
    iput-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->P:Z

    .line 5
    invoke-virtual {p0, v2, v2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p2

    if-eqz p2, :cond_22

    .line 6
    iget-boolean v0, p2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-eqz v0, :cond_22

    if-nez p1, :cond_21

    .line 7
    invoke-virtual {p0, p2, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    :cond_21
    return v1

    .line 8
    :cond_22
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->z()Z

    move-result p1

    if-eqz p1, :cond_29

    return v1

    :cond_29
    :goto_29
    return v2
.end method

.method public e()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 2
    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->i()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->g(I)V

    return-void
.end method

.method public e(I)V
    .registers 3

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    return-void
.end method

.method public final e(ILandroid/view/KeyEvent;)Z
    .registers 6

    .line 5
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object v2

    if-nez p1, :cond_43

    .line 7
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz p1, :cond_43

    .line 8
    invoke-interface {p1}, Lb/b/q/o;->f()Z

    move-result p1

    if-eqz p1, :cond_43

    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 9
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result p1

    if-nez p1, :cond_43

    .line 10
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {p1}, Lb/b/q/o;->b()Z

    move-result p1

    if-nez p1, :cond_3c

    .line 11
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez p1, :cond_62

    invoke-virtual {p0, v2, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_62

    .line 12
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {p1}, Lb/b/q/o;->d()Z

    move-result v0

    goto :goto_6a

    .line 13
    :cond_3c
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {p1}, Lb/b/q/o;->c()Z

    move-result v0

    goto :goto_6a

    .line 14
    :cond_43
    iget-boolean p1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-nez p1, :cond_64

    iget-boolean p1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->n:Z

    if-eqz p1, :cond_4c

    goto :goto_64

    .line 15
    :cond_4c
    iget-boolean p1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    if-eqz p1, :cond_62

    .line 16
    iget-boolean p1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->r:Z

    if-eqz p1, :cond_5b

    .line 17
    iput-boolean v1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    .line 18
    invoke-virtual {p0, v2, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result p1

    goto :goto_5c

    :cond_5b
    const/4 p1, 0x1

    :goto_5c
    if-eqz p1, :cond_62

    .line 19
    invoke-virtual {p0, v2, p2}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)V

    goto :goto_6a

    :cond_62
    const/4 v0, 0x0

    goto :goto_6a

    .line 20
    :cond_64
    :goto_64
    iget-boolean p1, v2, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    .line 21
    invoke-virtual {p0, v2, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    move v0, p1

    :goto_6a
    if-eqz v0, :cond_87

    .line 22
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "audio"

    .line 23
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    if-eqz p1, :cond_80

    .line 24
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->playSoundEffect(I)V

    goto :goto_87

    :cond_80
    const-string p1, "AppCompatDelegate"

    const-string p2, "Couldn\'t get audio manager"

    .line 25
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_87
    :goto_87
    return v0
.end method

.method public f()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_9

    .line 2
    invoke-static {p0}, Lb/b/k/c;->b(Lb/b/k/c;)V

    .line 3
    :cond_9
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->a0:Z

    if-eqz v0, :cond_18

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->c0:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_18
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->S:Z

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    .line 7
    iget v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    const/16 v1, -0x64

    if-eq v0, v1, :cond_48

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_48

    check-cast v0, Landroid/app/Activity;

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 9
    sget-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->i0:Lb/e/g;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_57

    .line 10
    :cond_48
    sget-object v0, Landroidx/appcompat/app/AppCompatDelegateImpl;->i0:Lb/e/g;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/e/g;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    :goto_57
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    if-eqz v0, :cond_5e

    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->j()V

    .line 13
    :cond_5e
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->n()V

    return-void
.end method

.method public f(I)V
    .registers 6

    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object v1

    .line 15
    iget-object v2, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-eqz v2, :cond_25

    .line 16
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 17
    iget-object v3, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v3, v2}, Lb/b/p/j/g;->e(Landroid/os/Bundle;)V

    .line 18
    invoke-virtual {v2}, Landroid/os/Bundle;->size()I

    move-result v3

    if-lez v3, :cond_1b

    .line 19
    iput-object v2, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->s:Landroid/os/Bundle;

    .line 20
    :cond_1b
    iget-object v2, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v2}, Lb/b/p/j/g;->s()V

    .line 21
    iget-object v2, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    invoke-virtual {v2}, Lb/b/p/j/g;->clear()V

    .line 22
    :cond_25
    iput-boolean v0, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->r:Z

    .line 23
    iput-boolean v0, v1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->q:Z

    const/16 v0, 0x6c

    if-eq p1, v0, :cond_2f

    if-nez p1, :cond_40

    .line 24
    :cond_2f
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz p1, :cond_40

    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object v0

    if-eqz v0, :cond_40

    .line 26
    iput-boolean p1, v0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->m:Z

    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, v0, p1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Landroid/view/KeyEvent;)Z

    :cond_40
    return-void
.end method

.method public g()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v1, 0x1

    .line 2
    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->d(Z)V

    :cond_a
    return-void
.end method

.method public final g(I)V
    .registers 4

    .line 3
    iget v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->b0:I

    const/4 v1, 0x1

    shl-int p1, v1, p1

    or-int/2addr p1, v0

    iput p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->b0:I

    .line 4
    iget-boolean p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->a0:Z

    if-nez p1, :cond_19

    .line 5
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->c0:Ljava/lang/Runnable;

    invoke-static {p1, v0}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 6
    iput-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->a0:Z

    :cond_19
    return-void
.end method

.method public h()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->S:Z

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->k()Z

    return-void
.end method

.method public h(I)V
    .registers 3

    const/16 v0, 0x6c

    if-ne p1, v0, :cond_e

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_e

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Z)V

    :cond_e
    return-void
.end method

.method public i()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->S:Z

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 3
    invoke-virtual {v1, v0}, Landroidx/appcompat/app/ActionBar;->d(Z)V

    :cond_c
    return-void
.end method

.method public i(I)V
    .registers 4

    const/4 v0, 0x0

    const/16 v1, 0x6c

    if-ne p1, v1, :cond_f

    .line 4
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object p1

    if-eqz p1, :cond_1d

    .line 5
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/ActionBar;->b(Z)V

    goto :goto_1d

    :cond_f
    if-nez p1, :cond_1d

    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object p1

    .line 7
    iget-boolean v1, p1, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->o:Z

    if-eqz v1, :cond_1d

    .line 8
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;Z)V

    :cond_1d
    :goto_1d
    return-void
.end method

.method public final j(I)I
    .registers 4

    const-string v0, "AppCompatDelegate"

    const/16 v1, 0x8

    if-ne p1, v1, :cond_e

    const-string p1, "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature."

    .line 1
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x6c

    return p1

    :cond_e
    const/16 v1, 0x9

    if-ne p1, v1, :cond_19

    const-string p1, "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY id when requesting this feature."

    .line 2
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x6d

    :cond_19
    return p1
.end method

.method public k()Z
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Z)Z

    move-result v0

    return v0
.end method

.method public final l()V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 2
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    .line 4
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    .line 6
    invoke-virtual {v0, v2, v3, v4, v1}, Landroidx/appcompat/widget/ContentFrameLayout;->a(IIII)V

    .line 7
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    sget-object v2, Lb/b/j;->AppCompatTheme:[I

    invoke-virtual {v1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 8
    sget v2, Lb/b/j;->AppCompatTheme_windowMinWidthMajor:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMajor()Landroid/util/TypedValue;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 9
    sget v2, Lb/b/j;->AppCompatTheme_windowMinWidthMinor:I

    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getMinWidthMinor()Landroid/util/TypedValue;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 10
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedWidthMajor:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 11
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedWidthMajor:I

    .line 12
    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMajor()Landroid/util/TypedValue;

    move-result-object v3

    .line 13
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 14
    :cond_4f
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedWidthMinor:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_60

    .line 15
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedWidthMinor:I

    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedWidthMinor()Landroid/util/TypedValue;

    move-result-object v3

    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 18
    :cond_60
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedHeightMajor:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 19
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedHeightMajor:I

    .line 20
    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMajor()Landroid/util/TypedValue;

    move-result-object v3

    .line 21
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 22
    :cond_71
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedHeightMinor:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 23
    sget v2, Lb/b/j;->AppCompatTheme_windowFixedHeightMinor:I

    .line 24
    invoke-virtual {v0}, Landroidx/appcompat/widget/ContentFrameLayout;->getFixedHeightMinor()Landroid/util/TypedValue;

    move-result-object v3

    .line 25
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 26
    :cond_82
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 27
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method

.method public final m()I
    .registers 3

    .line 1
    iget v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->U:I

    const/16 v1, -0x64

    if-eq v0, v1, :cond_7

    goto :goto_b

    :cond_7
    invoke-static {}, Lb/b/k/c;->j()I

    move-result v0

    :goto_b
    return v0
.end method

.method public final n()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Y:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->a()V

    .line 3
    :cond_7
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->Z:Landroidx/appcompat/app/AppCompatDelegateImpl$p;

    if-eqz v0, :cond_e

    .line 4
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl$p;->a()V

    :cond_e
    return-void
.end method

.method public final o()Landroid/view/ViewGroup;
    .registers 8

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    sget-object v1, Lb/b/j;->AppCompatTheme:[I

    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 2
    sget v1, Lb/b/j;->AppCompatTheme_windowActionBar:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1a6

    .line 3
    sget v1, Lb/b/j;->AppCompatTheme_windowNoTitle:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_1e

    .line 4
    invoke-virtual {p0, v3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(I)Z

    goto :goto_2b

    .line 5
    :cond_1e
    sget v1, Lb/b/j;->AppCompatTheme_windowActionBar:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_2b

    const/16 v1, 0x6c

    .line 6
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(I)Z

    .line 7
    :cond_2b
    :goto_2b
    sget v1, Lb/b/j;->AppCompatTheme_windowActionBarOverlay:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    const/16 v4, 0x6d

    if-eqz v1, :cond_38

    .line 8
    invoke-virtual {p0, v4}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(I)Z

    .line 9
    :cond_38
    sget v1, Lb/b/j;->AppCompatTheme_windowActionModeOverlay:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_45

    const/16 v1, 0xa

    .line 10
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatDelegateImpl;->b(I)Z

    .line 11
    :cond_45
    sget v1, Lb/b/j;->AppCompatTheme_android_windowIsFloating:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->K:Z

    .line 12
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->s()V

    .line 14
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 16
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->L:Z

    const/4 v5, 0x0

    if-nez v1, :cond_d6

    .line 17
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->K:Z

    if-eqz v1, :cond_75

    .line 18
    sget v1, Lb/b/g;->abc_dialog_title_material:I

    invoke-virtual {v0, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 19
    iput-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->I:Z

    iput-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    goto/16 :goto_eb

    .line 20
    :cond_75
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    if-eqz v0, :cond_d4

    .line 21
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 22
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v6, Lb/b/a;->actionBarTheme:I

    invoke-virtual {v1, v6, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 23
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v1, :cond_97

    .line 24
    new-instance v1, Lb/b/p/d;

    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {v1, v3, v0}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    goto :goto_99

    .line 25
    :cond_97
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    .line 26
    :goto_99
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lb/b/g;->abc_screen_toolbar:I

    .line 27
    invoke-virtual {v0, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 28
    sget v1, Lb/b/f;->decor_content_parent:I

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lb/b/q/o;

    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    .line 30
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->v()Landroid/view/Window$Callback;

    move-result-object v3

    invoke-interface {v1, v3}, Lb/b/q/o;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 31
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->I:Z

    if-eqz v1, :cond_bf

    .line 32
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    invoke-interface {v1, v4}, Lb/b/q/o;->a(I)V

    .line 33
    :cond_bf
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->F:Z

    if-eqz v1, :cond_c9

    .line 34
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    const/4 v3, 0x2

    invoke-interface {v1, v3}, Lb/b/q/o;->a(I)V

    .line 35
    :cond_c9
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->G:Z

    if-eqz v1, :cond_eb

    .line 36
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    const/4 v3, 0x5

    invoke-interface {v1, v3}, Lb/b/q/o;->a(I)V

    goto :goto_eb

    :cond_d4
    move-object v0, v5

    goto :goto_eb

    .line 37
    :cond_d6
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->J:Z

    if-eqz v1, :cond_e3

    .line 38
    sget v1, Lb/b/g;->abc_screen_simple_overlay_action_mode:I

    invoke-virtual {v0, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_eb

    .line 39
    :cond_e3
    sget v1, Lb/b/g;->abc_screen_simple:I

    invoke-virtual {v0, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    :cond_eb
    :goto_eb
    if-eqz v0, :cond_160

    .line 40
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v1, v3, :cond_fc

    .line 41
    new-instance v1, Landroidx/appcompat/app/AppCompatDelegateImpl$c;

    invoke-direct {v1, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$c;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/s;)V

    goto :goto_10b

    .line 42
    :cond_fc
    instance-of v1, v0, Lb/b/q/s;

    if-eqz v1, :cond_10b

    .line 43
    move-object v1, v0

    check-cast v1, Lb/b/q/s;

    new-instance v3, Landroidx/appcompat/app/AppCompatDelegateImpl$d;

    invoke-direct {v3, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$d;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    invoke-interface {v1, v3}, Lb/b/q/s;->setOnFitSystemWindowsListener(Lb/b/q/s$a;)V

    .line 44
    :cond_10b
    :goto_10b
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-nez v1, :cond_119

    .line 45
    sget v1, Lb/b/f;->title:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->D:Landroid/widget/TextView;

    .line 46
    :cond_119
    invoke-static {v0}, Lb/b/q/m0;->b(Landroid/view/View;)V

    .line 47
    sget v1, Lb/b/f;->action_bar_activity_content:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/appcompat/widget/ContentFrameLayout;

    .line 48
    iget-object v3, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    const v4, 0x1020002

    invoke-virtual {v3, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_152

    .line 49
    :goto_131
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-lez v6, :cond_142

    .line 50
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 51
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 52
    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto :goto_131

    :cond_142
    const/4 v2, -0x1

    .line 53
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->setId(I)V

    .line 54
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setId(I)V

    .line 55
    instance-of v2, v3, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_152

    .line 56
    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    :cond_152
    iget-object v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v2, v0}, Landroid/view/Window;->setContentView(Landroid/view/View;)V

    .line 58
    new-instance v2, Landroidx/appcompat/app/AppCompatDelegateImpl$e;

    invoke-direct {v2, p0}, Landroidx/appcompat/app/AppCompatDelegateImpl$e;-><init>(Landroidx/appcompat/app/AppCompatDelegateImpl;)V

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/ContentFrameLayout;->setAttachListener(Landroidx/appcompat/widget/ContentFrameLayout$a;)V

    return-object v0

    .line 59
    :cond_160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AppCompat does not support the current theme features: { windowActionBar: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", windowActionBarOverlay: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->I:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", android:windowIsFloating: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->K:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", windowActionModeOverlay: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->J:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", windowNoTitle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->L:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " }"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1a6
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 61
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You need to use a Theme.AppCompat theme (or descendant) with this activity."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 5

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatDelegateImpl;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public p()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v0, :cond_7

    .line 2
    invoke-interface {v0}, Lb/b/q/o;->g()V

    .line 3
    :cond_7
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_26

    .line 4
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->y:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 5
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 6
    :try_start_1e
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V
    :try_end_23
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1e .. :try_end_23} :catch_23

    :catch_23
    :cond_23
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->x:Landroid/widget/PopupWindow;

    .line 8
    :cond_26
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->q()V

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object v0

    if-eqz v0, :cond_37

    .line 10
    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-eqz v0, :cond_37

    .line 11
    invoke-virtual {v0}, Lb/b/p/j/g;->close()V

    :cond_37
    return-void
.end method

.method public q()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->z:Lb/h/m/c0;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Lb/h/m/c0;->a()V

    :cond_7
    return-void
.end method

.method public final r()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->B:Z

    if-nez v0, :cond_50

    .line 2
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->o()Landroid/view/ViewGroup;

    move-result-object v0

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->u()Ljava/lang/CharSequence;

    move-result-object v0

    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_31

    .line 5
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->s:Lb/b/q/o;

    if-eqz v1, :cond_1c

    .line 6
    invoke-interface {v1, v0}, Lb/b/q/o;->setWindowTitle(Ljava/lang/CharSequence;)V

    goto :goto_31

    .line 7
    :cond_1c
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_2a

    .line 8
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->A()Landroidx/appcompat/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/appcompat/app/ActionBar;->a(Ljava/lang/CharSequence;)V

    goto :goto_31

    .line 9
    :cond_2a
    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->D:Landroid/widget/TextView;

    if-eqz v1, :cond_31

    .line 10
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    :cond_31
    :goto_31
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->l()V

    .line 12
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->C:Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/ViewGroup;)V

    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->B:Z

    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(IZ)Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;

    move-result-object v0

    .line 15
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->T:Z

    if-nez v1, :cond_50

    if-eqz v0, :cond_4b

    iget-object v0, v0, Landroidx/appcompat/app/AppCompatDelegateImpl$PanelFeatureState;->j:Lb/b/p/j/g;

    if-nez v0, :cond_50

    :cond_4b
    const/16 v0, 0x6c

    .line 16
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->g(I)V

    :cond_50
    return-void
.end method

.method public final s()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    if-nez v0, :cond_13

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_13

    .line 2
    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->a(Landroid/view/Window;)V

    .line 3
    :cond_13
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    if-eqz v0, :cond_18

    return-void

    .line 4
    :cond_18
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "We have not been given a Window"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final t()Landroid/content/Context;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->h()Landroid/content/Context;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_10

    .line 3
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    :cond_10
    return-object v0
.end method

.method public final u()Ljava/lang/CharSequence;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_d

    .line 2
    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    .line 3
    :cond_d
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->r:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final v()Landroid/view/Window$Callback;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->m:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    return-object v0
.end method

.method public final w()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->r()V

    .line 2
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->H:Z

    if-eqz v0, :cond_38

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    if-eqz v0, :cond_c

    goto :goto_38

    .line 3
    :cond_c
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_20

    .line 4
    new-instance v0, Lb/b/k/j;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    iget-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->I:Z

    invoke-direct {v0, v1, v2}, Lb/b/k/j;-><init>(Landroid/app/Activity;Z)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    goto :goto_2f

    .line 5
    :cond_20
    instance-of v0, v0, Landroid/app/Dialog;

    if-eqz v0, :cond_2f

    .line 6
    new-instance v0, Lb/b/k/j;

    iget-object v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    check-cast v1, Landroid/app/Dialog;

    invoke-direct {v0, v1}, Lb/b/k/j;-><init>(Landroid/app/Dialog;)V

    iput-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    .line 7
    :cond_2f
    :goto_2f
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->p:Landroidx/appcompat/app/ActionBar;

    if-eqz v0, :cond_38

    .line 8
    iget-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->d0:Z

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->c(Z)V

    :cond_38
    :goto_38
    return-void
.end method

.method public final x()Z
    .registers 8

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->X:Z

    const/4 v1, 0x1

    if-nez v0, :cond_51

    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_51

    .line 2
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v2, 0x0

    if-nez v0, :cond_15

    return v2

    .line 3
    :cond_15
    :try_start_15
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_1e

    const/high16 v3, 0x100c0000

    goto :goto_28

    .line 4
    :cond_1e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x18

    if-lt v3, v4, :cond_27

    const/high16 v3, 0xc0000

    goto :goto_28

    :cond_27
    const/4 v3, 0x0

    .line 5
    :goto_28
    new-instance v4, Landroid/content/ComponentName;

    iget-object v5, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->l:Landroid/content/Context;

    iget-object v6, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->k:Ljava/lang/Object;

    .line 6
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 7
    invoke-virtual {v0, v4, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    if-eqz v0, :cond_43

    .line 8
    iget v0, v0, Landroid/content/pm/ActivityInfo;->configChanges:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_43

    const/4 v0, 0x1

    goto :goto_44

    :cond_43
    const/4 v0, 0x0

    :goto_44
    iput-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->W:Z
    :try_end_46
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_15 .. :try_end_46} :catch_47

    goto :goto_51

    :catch_47
    move-exception v0

    const-string v3, "AppCompatDelegate"

    const-string v4, "Exception while getting ActivityInfo"

    .line 9
    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 10
    iput-boolean v2, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->W:Z

    .line 11
    :cond_51
    :goto_51
    iput-boolean v1, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->X:Z

    .line 12
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->W:Z

    return v0
.end method

.method public y()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->A:Z

    return v0
.end method

.method public z()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl;->v:Lb/b/p/b;

    const/4 v1, 0x1

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/p/b;->a()V

    return v1

    .line 3
    :cond_9
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatDelegateImpl;->c()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 4
    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->f()Z

    move-result v0

    if-eqz v0, :cond_16

    return v1

    :cond_16
    const/4 v0, 0x0

    return v0
.end method
