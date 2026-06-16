.class public Lb/b/k/j;
.super Landroidx/appcompat/app/ActionBar;
.source "WindowDecorActionBar.java"

# interfaces
.implements Landroidx/appcompat/widget/ActionBarOverlayLayout$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/k/j$d;
    }
.end annotation


# static fields
.field public static final B:Landroid/view/animation/Interpolator;

.field public static final C:Landroid/view/animation/Interpolator;


# instance fields
.field public final A:Lb/h/m/f0;

.field public a:Landroid/content/Context;

.field public b:Landroid/content/Context;

.field public c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

.field public d:Landroidx/appcompat/widget/ActionBarContainer;

.field public e:Lb/b/q/p;

.field public f:Landroidx/appcompat/widget/ActionBarContextView;

.field public g:Landroid/view/View;

.field public h:Lb/b/q/z;

.field public i:Z

.field public j:Lb/b/k/j$d;

.field public k:Lb/b/p/b;

.field public l:Lb/b/p/b$a;

.field public m:Z

.field public n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/appcompat/app/ActionBar$a;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:I

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Lb/b/p/h;

.field public w:Z

.field public x:Z

.field public final y:Lb/h/m/d0;

.field public final z:Lb/h/m/d0;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    sput-object v0, Lb/b/k/j;->B:Landroid/view/animation/Interpolator;

    .line 2
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    sput-object v0, Lb/b/k/j;->C:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Z)V
    .registers 4

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/ActionBar;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/b/k/j;->n:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lb/b/k/j;->p:I

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lb/b/k/j;->q:Z

    .line 6
    iput-boolean v0, p0, Lb/b/k/j;->u:Z

    .line 7
    new-instance v0, Lb/b/k/j$a;

    invoke-direct {v0, p0}, Lb/b/k/j$a;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->y:Lb/h/m/d0;

    .line 8
    new-instance v0, Lb/b/k/j$b;

    invoke-direct {v0, p0}, Lb/b/k/j$b;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->z:Lb/h/m/d0;

    .line 9
    new-instance v0, Lb/b/k/j$c;

    invoke-direct {v0, p0}, Lb/b/k/j$c;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->A:Lb/h/m/f0;

    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Lb/b/k/j;->b(Landroid/view/View;)V

    if-nez p2, :cond_42

    const p2, 0x1020002

    .line 13
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lb/b/k/j;->g:Landroid/view/View;

    :cond_42
    return-void
.end method

.method public constructor <init>(Landroid/app/Dialog;)V
    .registers 3

    .line 14
    invoke-direct {p0}, Landroidx/appcompat/app/ActionBar;-><init>()V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/b/k/j;->n:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lb/b/k/j;->p:I

    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lb/b/k/j;->q:Z

    .line 19
    iput-boolean v0, p0, Lb/b/k/j;->u:Z

    .line 20
    new-instance v0, Lb/b/k/j$a;

    invoke-direct {v0, p0}, Lb/b/k/j$a;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->y:Lb/h/m/d0;

    .line 21
    new-instance v0, Lb/b/k/j$b;

    invoke-direct {v0, p0}, Lb/b/k/j$b;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->z:Lb/h/m/d0;

    .line 22
    new-instance v0, Lb/b/k/j$c;

    invoke-direct {v0, p0}, Lb/b/k/j$c;-><init>(Lb/b/k/j;)V

    iput-object v0, p0, Lb/b/k/j;->A:Lb/h/m/f0;

    .line 23
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/b/k/j;->b(Landroid/view/View;)V

    return-void
.end method

.method public static a(ZZZ)Z
    .registers 4

    const/4 v0, 0x1

    if-eqz p2, :cond_4

    return v0

    :cond_4
    if-nez p0, :cond_a

    if-eqz p1, :cond_9

    goto :goto_a

    :cond_9
    return v0

    :cond_a
    :goto_a
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public a(Lb/b/p/b$a;)Lb/b/p/b;
    .registers 4

    .line 14
    iget-object v0, p0, Lb/b/k/j;->j:Lb/b/k/j$d;

    if-eqz v0, :cond_7

    .line 15
    invoke-virtual {v0}, Lb/b/k/j$d;->a()V

    .line 16
    :cond_7
    iget-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 17
    iget-object v0, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->d()V

    .line 18
    new-instance v0, Lb/b/k/j$d;

    iget-object v1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Lb/b/k/j$d;-><init>(Lb/b/k/j;Landroid/content/Context;Lb/b/p/b$a;)V

    .line 19
    invoke-virtual {v0}, Lb/b/k/j$d;->k()Z

    move-result p1

    if-eqz p1, :cond_39

    .line 20
    iput-object v0, p0, Lb/b/k/j;->j:Lb/b/k/j$d;

    .line 21
    invoke-virtual {v0}, Lb/b/k/j$d;->i()V

    .line 22
    iget-object p1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContextView;->a(Lb/b/p/b;)V

    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Lb/b/k/j;->e(Z)V

    .line 24
    iget-object p1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    const/16 v1, 0x20

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    return-object v0

    :cond_39
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a(Landroid/view/View;)Lb/b/q/p;
    .registers 5

    .line 1
    instance-of v0, p1, Lb/b/q/p;

    if-eqz v0, :cond_7

    .line 2
    check-cast p1, Lb/b/q/p;

    return-object p1

    .line 3
    :cond_7
    instance-of v0, p1, Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_12

    .line 4
    check-cast p1, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->getWrapper()Lb/b/q/p;

    move-result-object p1

    return-object p1

    .line 5
    :cond_12
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t make a decor toolbar out of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_29

    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    goto :goto_2b

    :cond_29
    const-string p1, "null"

    :goto_2b
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a()V
    .registers 2

    .line 26
    iget-boolean v0, p0, Lb/b/k/j;->s:Z

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lb/b/k/j;->s:Z

    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, Lb/b/k/j;->l(Z)V

    :cond_b
    return-void
.end method

.method public a(F)V
    .registers 3

    .line 7
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {v0, p1}, Lb/h/m/y;->a(Landroid/view/View;F)V

    return-void
.end method

.method public a(I)V
    .registers 2

    .line 9
    iput p1, p0, Lb/b/k/j;->p:I

    return-void
.end method

.method public a(II)V
    .registers 5

    .line 11
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0}, Lb/b/q/p;->h()I

    move-result v0

    and-int/lit8 v1, p2, 0x4

    if-eqz v1, :cond_d

    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Lb/b/k/j;->i:Z

    .line 13
    :cond_d
    iget-object v1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    and-int/2addr p1, p2

    not-int p2, p2

    and-int/2addr p2, v0

    or-int/2addr p1, p2

    invoke-interface {v1, p1}, Lb/b/q/p;->b(I)V

    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 2

    .line 8
    iget-object p1, p0, Lb/b/k/j;->a:Landroid/content/Context;

    invoke-static {p1}, Lb/b/p/a;->a(Landroid/content/Context;)Lb/b/p/a;

    move-result-object p1

    invoke-virtual {p1}, Lb/b/p/a;->f()Z

    move-result p1

    invoke-virtual {p0, p1}, Lb/b/k/j;->i(Z)V

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 10
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0, p1}, Lb/b/q/p;->setWindowTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 25
    iput-boolean p1, p0, Lb/b/k/j;->q:Z

    return-void
.end method

.method public a(ILandroid/view/KeyEvent;)Z
    .registers 7

    .line 29
    iget-object v0, p0, Lb/b/k/j;->j:Lb/b/k/j$d;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 30
    :cond_6
    invoke-virtual {v0}, Lb/b/k/j$d;->c()Landroid/view/Menu;

    move-result-object v0

    if-eqz v0, :cond_29

    if-eqz p2, :cond_13

    .line 31
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v2

    goto :goto_14

    :cond_13
    const/4 v2, -0x1

    .line 32
    :goto_14
    invoke-static {v2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v2

    .line 33
    invoke-virtual {v2}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_20

    goto :goto_21

    :cond_20
    const/4 v3, 0x0

    :goto_21
    invoke-interface {v0, v3}, Landroid/view/Menu;->setQwertyMode(Z)V

    .line 34
    invoke-interface {v0, p1, p2, v1}, Landroid/view/Menu;->performShortcut(ILandroid/view/KeyEvent;I)Z

    move-result p1

    return p1

    :cond_29
    return v1
.end method

.method public b()V
    .registers 2

    .line 24
    iget-object v0, p0, Lb/b/k/j;->v:Lb/b/p/h;

    if-eqz v0, :cond_a

    .line 25
    invoke-virtual {v0}, Lb/b/p/h;->a()V

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lb/b/k/j;->v:Lb/b/p/h;

    :cond_a
    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 7

    .line 1
    sget v0, Lb/b/f;->decor_content_parent:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iput-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_f

    .line 2
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setActionBarVisibilityCallback(Landroidx/appcompat/widget/ActionBarOverlayLayout$d;)V

    .line 3
    :cond_f
    sget v0, Lb/b/f;->action_bar:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/b/k/j;->a(Landroid/view/View;)Lb/b/q/p;

    move-result-object v0

    iput-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    .line 4
    sget v0, Lb/b/f;->action_context_bar:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/ActionBarContextView;

    iput-object v0, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    .line 5
    sget v0, Lb/b/f;->action_bar_container:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/ActionBarContainer;

    iput-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    .line 6
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    if-eqz v0, :cond_94

    iget-object v1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v1, :cond_94

    if-eqz p1, :cond_94

    .line 7
    invoke-interface {v0}, Lb/b/q/p;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lb/b/k/j;->a:Landroid/content/Context;

    .line 8
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1}, Lb/b/q/p;->h()I

    move-result p1

    and-int/lit8 p1, p1, 0x4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_4d

    const/4 p1, 0x1

    goto :goto_4e

    :cond_4d
    const/4 p1, 0x0

    :goto_4e
    if-eqz p1, :cond_52

    .line 9
    iput-boolean v0, p0, Lb/b/k/j;->i:Z

    .line 10
    :cond_52
    iget-object v2, p0, Lb/b/k/j;->a:Landroid/content/Context;

    invoke-static {v2}, Lb/b/p/a;->a(Landroid/content/Context;)Lb/b/p/a;

    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lb/b/p/a;->a()Z

    move-result v3

    if-nez v3, :cond_63

    if-eqz p1, :cond_61

    goto :goto_63

    :cond_61
    const/4 p1, 0x0

    goto :goto_64

    :cond_63
    :goto_63
    const/4 p1, 0x1

    :goto_64
    invoke-virtual {p0, p1}, Lb/b/k/j;->k(Z)V

    .line 12
    invoke-virtual {v2}, Lb/b/p/a;->f()Z

    move-result p1

    invoke-virtual {p0, p1}, Lb/b/k/j;->i(Z)V

    .line 13
    iget-object p1, p0, Lb/b/k/j;->a:Landroid/content/Context;

    const/4 v2, 0x0

    sget-object v3, Lb/b/j;->ActionBar:[I

    sget v4, Lb/b/a;->actionBarStyle:I

    invoke-virtual {p1, v2, v3, v4, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 14
    sget v2, Lb/b/j;->ActionBar_hideOnContentScroll:I

    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    if-eqz v2, :cond_84

    .line 15
    invoke-virtual {p0, v0}, Lb/b/k/j;->j(Z)V

    .line 16
    :cond_84
    sget v0, Lb/b/j;->ActionBar_elevation:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    if-eqz v0, :cond_90

    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Lb/b/k/j;->a(F)V

    .line 18
    :cond_90
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    .line 19
    :cond_94
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lb/b/k/j;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " can only be used with a compatible window decor layout"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Z)V
    .registers 5

    .line 20
    iget-boolean v0, p0, Lb/b/k/j;->m:Z

    if-ne p1, v0, :cond_5

    return-void

    .line 21
    :cond_5
    iput-boolean p1, p0, Lb/b/k/j;->m:Z

    .line 22
    iget-object v0, p0, Lb/b/k/j;->n:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_e
    if-ge v1, v0, :cond_1e

    .line 23
    iget-object v2, p0, Lb/b/k/j;->n:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/app/ActionBar$a;

    invoke-interface {v2, p1}, Landroidx/appcompat/app/ActionBar$a;->a(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    :cond_1e
    return-void
.end method

.method public c()V
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/k/j;->s:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/b/k/j;->s:Z

    .line 3
    invoke-virtual {p0, v0}, Lb/b/k/j;->l(Z)V

    :cond_a
    return-void
.end method

.method public c(Z)V
    .registers 3

    .line 4
    iget-boolean v0, p0, Lb/b/k/j;->i:Z

    if-nez v0, :cond_7

    .line 5
    invoke-virtual {p0, p1}, Lb/b/k/j;->h(Z)V

    :cond_7
    return-void
.end method

.method public d()V
    .registers 1

    return-void
.end method

.method public d(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/b/k/j;->w:Z

    if-nez p1, :cond_b

    .line 2
    iget-object p1, p0, Lb/b/k/j;->v:Lb/b/p/h;

    if-eqz p1, :cond_b

    .line 3
    invoke-virtual {p1}, Lb/b/p/h;->a()V

    :cond_b
    return-void
.end method

.method public e(Z)V
    .registers 10

    if-eqz p1, :cond_6

    .line 1
    invoke-virtual {p0}, Lb/b/k/j;->p()V

    goto :goto_9

    .line 2
    :cond_6
    invoke-virtual {p0}, Lb/b/k/j;->n()V

    .line 3
    :goto_9
    invoke-virtual {p0}, Lb/b/k/j;->o()Z

    move-result v0

    const/4 v1, 0x4

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v0, :cond_3e

    const-wide/16 v4, 0x64

    const-wide/16 v6, 0xc8

    if-eqz p1, :cond_26

    .line 4
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1, v1, v4, v5}, Lb/b/q/p;->a(IJ)Lb/h/m/c0;

    move-result-object p1

    .line 5
    iget-object v0, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, v3, v6, v7}, Lb/b/q/a;->a(IJ)Lb/h/m/c0;

    move-result-object v0

    goto :goto_32

    .line 6
    :cond_26
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1, v3, v6, v7}, Lb/b/q/p;->a(IJ)Lb/h/m/c0;

    move-result-object v0

    .line 7
    iget-object p1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v2, v4, v5}, Lb/b/q/a;->a(IJ)Lb/h/m/c0;

    move-result-object p1

    .line 8
    :goto_32
    new-instance v1, Lb/b/p/h;

    invoke-direct {v1}, Lb/b/p/h;-><init>()V

    .line 9
    invoke-virtual {v1, p1, v0}, Lb/b/p/h;->a(Lb/h/m/c0;Lb/h/m/c0;)Lb/b/p/h;

    .line 10
    invoke-virtual {v1}, Lb/b/p/h;->c()V

    goto :goto_55

    :cond_3e
    if-eqz p1, :cond_4b

    .line 11
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1, v1}, Lb/b/q/p;->setVisibility(I)V

    .line 12
    iget-object p1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v3}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    goto :goto_55

    .line 13
    :cond_4b
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1, v3}, Lb/b/q/p;->setVisibility(I)V

    .line 14
    iget-object p1, p0, Lb/b/k/j;->f:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    :goto_55
    return-void
.end method

.method public f(Z)V
    .registers 6

    .line 1
    iget-object v0, p0, Lb/b/k/j;->v:Lb/b/p/h;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Lb/b/p/h;->a()V

    .line 3
    :cond_7
    iget v0, p0, Lb/b/k/j;->p:I

    if-nez v0, :cond_74

    iget-boolean v0, p0, Lb/b/k/j;->w:Z

    if-nez v0, :cond_11

    if-eqz p1, :cond_74

    .line 4
    :cond_11
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 5
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarContainer;->setTransitioning(Z)V

    .line 6
    new-instance v0, Lb/b/p/h;

    invoke-direct {v0}, Lb/b/p/h;-><init>()V

    .line 7
    iget-object v2, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v2

    neg-int v2, v2

    int-to-float v2, v2

    if-eqz p1, :cond_3c

    const/4 p1, 0x2

    new-array p1, p1, [I

    .line 8
    fill-array-data p1, :array_7c

    .line 9
    iget-object v3, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v3, p1}, Landroid/widget/FrameLayout;->getLocationInWindow([I)V

    .line 10
    aget p1, p1, v1

    int-to-float p1, p1

    sub-float/2addr v2, p1

    .line 11
    :cond_3c
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {p1}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object p1

    invoke-virtual {p1, v2}, Lb/h/m/c0;->b(F)Lb/h/m/c0;

    .line 12
    iget-object v1, p0, Lb/b/k/j;->A:Lb/h/m/f0;

    invoke-virtual {p1, v1}, Lb/h/m/c0;->a(Lb/h/m/f0;)Lb/h/m/c0;

    .line 13
    invoke-virtual {v0, p1}, Lb/b/p/h;->a(Lb/h/m/c0;)Lb/b/p/h;

    .line 14
    iget-boolean p1, p0, Lb/b/k/j;->q:Z

    if-eqz p1, :cond_5f

    iget-object p1, p0, Lb/b/k/j;->g:Landroid/view/View;

    if-eqz p1, :cond_5f

    .line 15
    invoke-static {p1}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object p1

    invoke-virtual {p1, v2}, Lb/h/m/c0;->b(F)Lb/h/m/c0;

    invoke-virtual {v0, p1}, Lb/b/p/h;->a(Lb/h/m/c0;)Lb/b/p/h;

    .line 16
    :cond_5f
    sget-object p1, Lb/b/k/j;->B:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, p1}, Lb/b/p/h;->a(Landroid/view/animation/Interpolator;)Lb/b/p/h;

    const-wide/16 v1, 0xfa

    .line 17
    invoke-virtual {v0, v1, v2}, Lb/b/p/h;->a(J)Lb/b/p/h;

    .line 18
    iget-object p1, p0, Lb/b/k/j;->y:Lb/h/m/d0;

    invoke-virtual {v0, p1}, Lb/b/p/h;->a(Lb/h/m/d0;)Lb/b/p/h;

    .line 19
    iput-object v0, p0, Lb/b/k/j;->v:Lb/b/p/h;

    .line 20
    invoke-virtual {v0}, Lb/b/p/h;->c()V

    goto :goto_7a

    .line 21
    :cond_74
    iget-object p1, p0, Lb/b/k/j;->y:Lb/h/m/d0;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lb/h/m/d0;->a(Landroid/view/View;)V

    :goto_7a
    return-void

    nop

    :array_7c
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public f()Z
    .registers 2

    .line 22
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    if-eqz v0, :cond_11

    invoke-interface {v0}, Lb/b/q/p;->l()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 23
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0}, Lb/b/q/p;->collapseActionView()V

    const/4 v0, 0x1

    return v0

    :cond_11
    const/4 v0, 0x0

    return v0
.end method

.method public g()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0}, Lb/b/q/p;->h()I

    move-result v0

    return v0
.end method

.method public g(Z)V
    .registers 6

    .line 2
    iget-object v0, p0, Lb/b/k/j;->v:Lb/b/p/h;

    if-eqz v0, :cond_7

    .line 3
    invoke-virtual {v0}, Lb/b/p/h;->a()V

    .line 4
    :cond_7
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarContainer;->setVisibility(I)V

    .line 5
    iget v0, p0, Lb/b/k/j;->p:I

    const/4 v1, 0x0

    if-nez v0, :cond_7e

    iget-boolean v0, p0, Lb/b/k/j;->w:Z

    if-nez v0, :cond_18

    if-eqz p1, :cond_7e

    .line 6
    :cond_18
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 7
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    if-eqz p1, :cond_37

    const/4 p1, 0x2

    new-array p1, p1, [I

    .line 8
    fill-array-data p1, :array_a4

    .line 9
    iget-object v2, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {v2, p1}, Landroid/widget/FrameLayout;->getLocationInWindow([I)V

    const/4 v2, 0x1

    .line 10
    aget p1, p1, v2

    int-to-float p1, p1

    sub-float/2addr v0, p1

    .line 11
    :cond_37
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 12
    new-instance p1, Lb/b/p/h;

    invoke-direct {p1}, Lb/b/p/h;-><init>()V

    .line 13
    iget-object v2, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {v2}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v2

    invoke-virtual {v2, v1}, Lb/h/m/c0;->b(F)Lb/h/m/c0;

    .line 14
    iget-object v3, p0, Lb/b/k/j;->A:Lb/h/m/f0;

    invoke-virtual {v2, v3}, Lb/h/m/c0;->a(Lb/h/m/f0;)Lb/h/m/c0;

    .line 15
    invoke-virtual {p1, v2}, Lb/b/p/h;->a(Lb/h/m/c0;)Lb/b/p/h;

    .line 16
    iget-boolean v2, p0, Lb/b/k/j;->q:Z

    if-eqz v2, :cond_69

    iget-object v2, p0, Lb/b/k/j;->g:Landroid/view/View;

    if-eqz v2, :cond_69

    .line 17
    invoke-virtual {v2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 18
    iget-object v0, p0, Lb/b/k/j;->g:Landroid/view/View;

    invoke-static {v0}, Lb/h/m/y;->a(Landroid/view/View;)Lb/h/m/c0;

    move-result-object v0

    invoke-virtual {v0, v1}, Lb/h/m/c0;->b(F)Lb/h/m/c0;

    invoke-virtual {p1, v0}, Lb/b/p/h;->a(Lb/h/m/c0;)Lb/b/p/h;

    .line 19
    :cond_69
    sget-object v0, Lb/b/k/j;->C:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, v0}, Lb/b/p/h;->a(Landroid/view/animation/Interpolator;)Lb/b/p/h;

    const-wide/16 v0, 0xfa

    .line 20
    invoke-virtual {p1, v0, v1}, Lb/b/p/h;->a(J)Lb/b/p/h;

    .line 21
    iget-object v0, p0, Lb/b/k/j;->z:Lb/h/m/d0;

    invoke-virtual {p1, v0}, Lb/b/p/h;->a(Lb/h/m/d0;)Lb/b/p/h;

    .line 22
    iput-object p1, p0, Lb/b/k/j;->v:Lb/b/p/h;

    .line 23
    invoke-virtual {p1}, Lb/b/p/h;->c()V

    goto :goto_9b

    .line 24
    :cond_7e
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 25
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 26
    iget-boolean p1, p0, Lb/b/k/j;->q:Z

    if-eqz p1, :cond_95

    iget-object p1, p0, Lb/b/k/j;->g:Landroid/view/View;

    if-eqz p1, :cond_95

    .line 27
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    :cond_95
    iget-object p1, p0, Lb/b/k/j;->z:Lb/h/m/d0;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lb/h/m/d0;->a(Landroid/view/View;)V

    .line 29
    :goto_9b
    iget-object p1, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz p1, :cond_a2

    .line 30
    invoke-static {p1}, Lb/h/m/y;->P(Landroid/view/View;)V

    :cond_a2
    return-void

    nop

    :array_a4
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public h()Landroid/content/Context;
    .registers 5

    .line 2
    iget-object v0, p0, Lb/b/k/j;->b:Landroid/content/Context;

    if-nez v0, :cond_27

    .line 3
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 4
    iget-object v1, p0, Lb/b/k/j;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 5
    sget v2, Lb/b/a;->actionBarWidgetTheme:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 6
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v0, :cond_23

    .line 7
    new-instance v1, Landroid/view/ContextThemeWrapper;

    iget-object v2, p0, Lb/b/k/j;->a:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v1, p0, Lb/b/k/j;->b:Landroid/content/Context;

    goto :goto_27

    .line 8
    :cond_23
    iget-object v0, p0, Lb/b/k/j;->a:Landroid/content/Context;

    iput-object v0, p0, Lb/b/k/j;->b:Landroid/content/Context;

    .line 9
    :cond_27
    :goto_27
    iget-object v0, p0, Lb/b/k/j;->b:Landroid/content/Context;

    return-object v0
.end method

.method public h(Z)V
    .registers 3

    const/4 v0, 0x4

    if-eqz p1, :cond_5

    const/4 p1, 0x4

    goto :goto_6

    :cond_5
    const/4 p1, 0x0

    .line 1
    :goto_6
    invoke-virtual {p0, p1, v0}, Lb/b/k/j;->a(II)V

    return-void
.end method

.method public final i(Z)V
    .registers 6

    .line 1
    iput-boolean p1, p0, Lb/b/k/j;->o:Z

    const/4 v0, 0x0

    if-nez p1, :cond_12

    .line 2
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {p1, v0}, Lb/b/q/p;->a(Lb/b/q/z;)V

    .line 3
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    iget-object v0, p0, Lb/b/k/j;->h:Lb/b/q/z;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Lb/b/q/z;)V

    goto :goto_1e

    .line 4
    :cond_12
    iget-object p1, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContainer;->setTabContainer(Lb/b/q/z;)V

    .line 5
    iget-object p1, p0, Lb/b/k/j;->e:Lb/b/q/p;

    iget-object v0, p0, Lb/b/k/j;->h:Lb/b/q/z;

    invoke-interface {p1, v0}, Lb/b/q/p;->a(Lb/b/q/z;)V

    .line 6
    :goto_1e
    invoke-virtual {p0}, Lb/b/k/j;->m()I

    move-result p1

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne p1, v0, :cond_29

    const/4 p1, 0x1

    goto :goto_2a

    :cond_29
    const/4 p1, 0x0

    .line 7
    :goto_2a
    iget-object v0, p0, Lb/b/k/j;->h:Lb/b/q/z;

    if-eqz v0, :cond_40

    if-eqz p1, :cond_3b

    .line 8
    invoke-virtual {v0, v2}, Landroid/widget/HorizontalScrollView;->setVisibility(I)V

    .line 9
    iget-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v0, :cond_40

    .line 10
    invoke-static {v0}, Lb/h/m/y;->P(Landroid/view/View;)V

    goto :goto_40

    :cond_3b
    const/16 v3, 0x8

    .line 11
    invoke-virtual {v0, v3}, Landroid/widget/HorizontalScrollView;->setVisibility(I)V

    .line 12
    :cond_40
    :goto_40
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    iget-boolean v3, p0, Lb/b/k/j;->o:Z

    if-nez v3, :cond_4a

    if-eqz p1, :cond_4a

    const/4 v3, 0x1

    goto :goto_4b

    :cond_4a
    const/4 v3, 0x0

    :goto_4b
    invoke-interface {v0, v3}, Lb/b/q/p;->b(Z)V

    .line 13
    iget-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iget-boolean v3, p0, Lb/b/k/j;->o:Z

    if-nez v3, :cond_57

    if-eqz p1, :cond_57

    goto :goto_58

    :cond_57
    const/4 v1, 0x0

    :goto_58
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHasNonEmbeddedTabs(Z)V

    return-void
.end method

.method public j(Z)V
    .registers 3

    if-eqz p1, :cond_13

    .line 1
    iget-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->j()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_13

    .line 2
    :cond_b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Action bar must be in overlay mode (Window.FEATURE_OVERLAY_ACTION_BAR) to enable hide on content scroll"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_13
    :goto_13
    iput-boolean p1, p0, Lb/b/k/j;->x:Z

    .line 4
    iget-object v0, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    return-void
.end method

.method public k(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0, p1}, Lb/b/q/p;->a(Z)V

    return-void
.end method

.method public l()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/k/j;->l:Lb/b/p/b$a;

    if-eqz v0, :cond_e

    .line 2
    iget-object v1, p0, Lb/b/k/j;->k:Lb/b/p/b;

    invoke-interface {v0, v1}, Lb/b/p/b$a;->a(Lb/b/p/b;)V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lb/b/k/j;->k:Lb/b/p/b;

    .line 4
    iput-object v0, p0, Lb/b/k/j;->l:Lb/b/p/b$a;

    :cond_e
    return-void
.end method

.method public final l(Z)V
    .registers 5

    .line 5
    iget-boolean v0, p0, Lb/b/k/j;->r:Z

    iget-boolean v1, p0, Lb/b/k/j;->s:Z

    iget-boolean v2, p0, Lb/b/k/j;->t:Z

    invoke-static {v0, v1, v2}, Lb/b/k/j;->a(ZZZ)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 6
    iget-boolean v0, p0, Lb/b/k/j;->u:Z

    if-nez v0, :cond_21

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lb/b/k/j;->u:Z

    .line 8
    invoke-virtual {p0, p1}, Lb/b/k/j;->g(Z)V

    goto :goto_21

    .line 9
    :cond_17
    iget-boolean v0, p0, Lb/b/k/j;->u:Z

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lb/b/k/j;->u:Z

    .line 11
    invoke-virtual {p0, p1}, Lb/b/k/j;->f(Z)V

    :cond_21
    :goto_21
    return-void
.end method

.method public m()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/k/j;->e:Lb/b/q/p;

    invoke-interface {v0}, Lb/b/q/p;->j()I

    move-result v0

    return v0
.end method

.method public final n()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/b/k/j;->t:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/b/k/j;->t:Z

    .line 3
    iget-object v1, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v1, :cond_e

    .line 4
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    .line 5
    :cond_e
    invoke-virtual {p0, v0}, Lb/b/k/j;->l(Z)V

    :cond_11
    return-void
.end method

.method public final o()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/k/j;->d:Landroidx/appcompat/widget/ActionBarContainer;

    invoke-static {v0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public final p()V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/b/k/j;->t:Z

    if-nez v0, :cond_12

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/b/k/j;->t:Z

    .line 3
    iget-object v1, p0, Lb/b/k/j;->c:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    if-eqz v1, :cond_e

    .line 4
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setShowingForActionMode(Z)V

    :cond_e
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Lb/b/k/j;->l(Z)V

    :cond_12
    return-void
.end method
