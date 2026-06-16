.class public Landroidx/drawerlayout/widget/DrawerLayout$b;
.super Lb/h/m/a;
.source "DrawerLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/drawerlayout/widget/DrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final d:Landroid/graphics/Rect;

.field public final synthetic e:Landroidx/drawerlayout/widget/DrawerLayout;


# direct methods
.method public constructor <init>(Landroidx/drawerlayout/widget/DrawerLayout;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->e:Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    .line 2
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->d:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 6

    .line 1
    sget-boolean v0, Landroidx/drawerlayout/widget/DrawerLayout;->T:Z

    if-eqz v0, :cond_8

    .line 2
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    goto :goto_2a

    .line 3
    :cond_8
    invoke-static {p2}, Lb/h/m/h0/c;->a(Lb/h/m/h0/c;)Lb/h/m/h0/c;

    move-result-object v0

    .line 4
    invoke-super {p0, p1, v0}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 5
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->f(Landroid/view/View;)V

    .line 6
    invoke-static {p1}, Lb/h/m/y;->y(Landroid/view/View;)Landroid/view/ViewParent;

    move-result-object v1

    .line 7
    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_1f

    .line 8
    check-cast v1, Landroid/view/View;

    invoke-virtual {p2, v1}, Lb/h/m/h0/c;->e(Landroid/view/View;)V

    .line 9
    :cond_1f
    invoke-virtual {p0, p2, v0}, Landroidx/drawerlayout/widget/DrawerLayout$b;->a(Lb/h/m/h0/c;Lb/h/m/h0/c;)V

    .line 10
    invoke-virtual {v0}, Lb/h/m/h0/c;->y()V

    .line 11
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p2, p1}, Landroidx/drawerlayout/widget/DrawerLayout$b;->a(Lb/h/m/h0/c;Landroid/view/ViewGroup;)V

    .line 12
    :goto_2a
    const-class p1, Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    .line 13
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->g(Z)V

    .line 14
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->h(Z)V

    .line 15
    sget-object p1, Lb/h/m/h0/c$a;->e:Lb/h/m/h0/c$a;

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->b(Lb/h/m/h0/c$a;)Z

    .line 16
    sget-object p1, Lb/h/m/h0/c$a;->f:Lb/h/m/h0/c$a;

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->b(Lb/h/m/h0/c$a;)Z

    return-void
.end method

.method public final a(Lb/h/m/h0/c;Landroid/view/ViewGroup;)V
    .registers 7

    .line 26
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_17

    .line 27
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 28
    invoke-static {v2}, Landroidx/drawerlayout/widget/DrawerLayout;->m(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 29
    invoke-virtual {p1, v2}, Lb/h/m/h0/c;->a(Landroid/view/View;)V

    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_17
    return-void
.end method

.method public final a(Lb/h/m/h0/c;Lb/h/m/h0/c;)V
    .registers 4

    .line 30
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->d:Landroid/graphics/Rect;

    .line 31
    invoke-virtual {p2, v0}, Lb/h/m/h0/c;->a(Landroid/graphics/Rect;)V

    .line 32
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->c(Landroid/graphics/Rect;)V

    .line 33
    invoke-virtual {p2, v0}, Lb/h/m/h0/c;->b(Landroid/graphics/Rect;)V

    .line 34
    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->d(Landroid/graphics/Rect;)V

    .line 35
    invoke-virtual {p2}, Lb/h/m/h0/c;->x()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->o(Z)V

    .line 36
    invoke-virtual {p2}, Lb/h/m/h0/c;->h()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->e(Ljava/lang/CharSequence;)V

    .line 37
    invoke-virtual {p2}, Lb/h/m/h0/c;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    .line 38
    invoke-virtual {p2}, Lb/h/m/h0/c;->f()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->b(Ljava/lang/CharSequence;)V

    .line 39
    invoke-virtual {p2}, Lb/h/m/h0/c;->p()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->f(Z)V

    .line 40
    invoke-virtual {p2}, Lb/h/m/h0/c;->o()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->e(Z)V

    .line 41
    invoke-virtual {p2}, Lb/h/m/h0/c;->q()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->g(Z)V

    .line 42
    invoke-virtual {p2}, Lb/h/m/h0/c;->r()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->h(Z)V

    .line 43
    invoke-virtual {p2}, Lb/h/m/h0/c;->l()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->a(Z)V

    .line 44
    invoke-virtual {p2}, Lb/h/m/h0/c;->v()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->m(Z)V

    .line 45
    invoke-virtual {p2}, Lb/h/m/h0/c;->s()Z

    move-result v0

    invoke-virtual {p1, v0}, Lb/h/m/h0/c;->j(Z)V

    .line 46
    invoke-virtual {p2}, Lb/h/m/h0/c;->c()I

    move-result p2

    invoke-virtual {p1, p2}, Lb/h/m/h0/c;->a(I)V

    return-void
.end method

.method public a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5

    .line 17
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_27

    .line 18
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object p1

    .line 19
    iget-object p2, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->e:Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {p2}, Landroidx/drawerlayout/widget/DrawerLayout;->d()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_25

    .line 20
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->e:Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {v0, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->e(Landroid/view/View;)I

    move-result p2

    .line 21
    iget-object v0, p0, Landroidx/drawerlayout/widget/DrawerLayout$b;->e:Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {v0, p2}, Landroidx/drawerlayout/widget/DrawerLayout;->c(I)Ljava/lang/CharSequence;

    move-result-object p2

    if-eqz p2, :cond_25

    .line 22
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_25
    const/4 p1, 0x1

    return p1

    .line 23
    :cond_27
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 5

    .line 24
    sget-boolean v0, Landroidx/drawerlayout/widget/DrawerLayout;->T:Z

    if-nez v0, :cond_d

    invoke-static {p2}, Landroidx/drawerlayout/widget/DrawerLayout;->m(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    return p1

    .line 25
    :cond_d
    :goto_d
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    const-class p1, Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method
