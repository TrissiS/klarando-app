.class public Ld/a/d/g/c;
.super Ljava/lang/Object;
.source "HiGuide.java"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Landroid/view/ViewGroup;

.field public c:Ld/a/d/g/b;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/d/g/d;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ld/a/d/g/d;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Ld/a/d/g/c;->a:Landroid/content/Context;

    .line 3
    invoke-virtual {p0}, Ld/a/d/g/c;->a()V

    return-void
.end method

.method public static synthetic a(Ld/a/d/g/c;Ld/a/d/g/b;)Ld/a/d/g/b;
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/d/g/c;->c:Ld/a/d/g/b;

    return-object p1
.end method

.method public static synthetic a(Ld/a/d/g/c;)Z
    .registers 1

    .line 2
    iget-boolean p0, p0, Ld/a/d/g/c;->f:Z

    return p0
.end method

.method public static synthetic b(Ld/a/d/g/c;)Ljava/util/List;
    .registers 1

    .line 1
    iget-object p0, p0, Ld/a/d/g/c;->d:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public a(Landroid/view/View$OnClickListener;)Ld/a/d/g/c;
    .registers 3

    .line 7
    iget-object v0, p0, Ld/a/d/g/c;->e:Ld/a/d/g/d;

    invoke-virtual {v0, p1}, Ld/a/d/g/d;->a(Landroid/view/View$OnClickListener;)Ld/a/d/g/d;

    return-object p0
.end method

.method public a(Landroid/view/View;[IILd/a/d/g/d$b;)Ld/a/d/g/c;
    .registers 6

    .line 8
    iget-object v0, p0, Ld/a/d/g/c;->e:Ld/a/d/g/d;

    invoke-virtual {v0, p1, p2, p3, p4}, Ld/a/d/g/d;->a(Landroid/view/View;[IILd/a/d/g/d$b;)Ld/a/d/g/d;

    return-object p0
.end method

.method public final a()V
    .registers 3

    .line 3
    iget-object v0, p0, Ld/a/d/g/c;->a:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/d/g/c;->d:Ljava/util/List;

    .line 5
    new-instance v0, Ld/a/d/g/d;

    invoke-direct {v0}, Ld/a/d/g/d;-><init>()V

    iput-object v0, p0, Ld/a/d/g/c;->e:Ld/a/d/g/d;

    .line 6
    iget-object v1, p0, Ld/a/d/g/c;->d:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b()V
    .registers 5

    .line 2
    iget-object v0, p0, Ld/a/d/g/c;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-le v0, v2, :cond_b

    goto :goto_c

    :cond_b
    const/4 v2, 0x0

    :goto_c
    iput-boolean v2, p0, Ld/a/d/g/c;->f:Z

    .line 3
    iget-object v0, p0, Ld/a/d/g/c;->d:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld/a/d/g/d;

    .line 4
    new-instance v1, Ld/a/d/g/b;

    iget-object v2, p0, Ld/a/d/g/c;->a:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Ld/a/d/g/b;-><init>(Landroid/content/Context;Ld/a/d/g/d;)V

    iput-object v1, p0, Ld/a/d/g/c;->c:Ld/a/d/g/b;

    .line 5
    sget v0, Ld/a/d/e;->guide_view:I

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setId(I)V

    .line 6
    iget-object v0, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    instance-of v0, v0, Landroid/widget/FrameLayout;

    const/4 v1, -0x1

    if-eqz v0, :cond_3c

    .line 7
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 8
    iget-object v1, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    iget-object v2, p0, Ld/a/d/g/c;->c:Ld/a/d/g/b;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-virtual {v1, v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_63

    .line 9
    :cond_3c
    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v2, p0, Ld/a/d/g/c;->a:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 10
    iget-object v2, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 11
    iget-object v3, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 12
    iget-object v3, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 14
    iget-object v1, p0, Ld/a/d/g/c;->b:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    :goto_63
    iget-object v0, p0, Ld/a/d/g/c;->c:Ld/a/d/g/b;

    invoke-virtual {v0}, Ld/a/d/g/b;->a()V

    .line 16
    iget-object v0, p0, Ld/a/d/g/c;->c:Ld/a/d/g/b;

    new-instance v1, Ld/a/d/g/c$a;

    invoke-direct {v1, p0}, Ld/a/d/g/c$a;-><init>(Ld/a/d/g/c;)V

    invoke-virtual {v0, v1}, Ld/a/d/g/b;->a(Ld/a/d/g/b$a;)V

    return-void
.end method
