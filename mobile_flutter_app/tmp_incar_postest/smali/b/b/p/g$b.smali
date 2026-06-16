.class public Lb/b/p/g$b;
.super Ljava/lang/Object;
.source "SupportMenuInflater.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public A:Lb/h/m/b;

.field public B:Ljava/lang/CharSequence;

.field public C:Ljava/lang/CharSequence;

.field public D:Landroid/content/res/ColorStateList;

.field public E:Landroid/graphics/PorterDuff$Mode;

.field public final synthetic F:Lb/b/p/g;

.field public a:Landroid/view/Menu;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:I

.field public j:I

.field public k:Ljava/lang/CharSequence;

.field public l:Ljava/lang/CharSequence;

.field public m:I

.field public n:C

.field public o:I

.field public p:C

.field public q:I

.field public r:I

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lb/b/p/g;Landroid/view/Menu;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/b/p/g$b;->D:Landroid/content/res/ColorStateList;

    .line 3
    iput-object p1, p0, Lb/b/p/g$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 4
    iput-object p2, p0, Lb/b/p/g$b;->a:Landroid/view/Menu;

    .line 5
    invoke-virtual {p0}, Lb/b/p/g$b;->d()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)C
    .registers 3

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 9
    :cond_4
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1
.end method

.method public final a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 47
    :try_start_1
    iget-object v1, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v1, v1, Lb/b/p/g;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p1, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 48
    invoke-virtual {v0, p2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p2

    const/4 v0, 0x1

    .line 49
    invoke-virtual {p2, v0}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 50
    invoke-virtual {p2, p3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_19} :catch_1a

    return-object p1

    :catch_1a
    move-exception p2

    .line 51
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Cannot instantiate class: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "SupportMenuInflater"

    invoke-static {p3, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method public a()V
    .registers 6

    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lb/b/p/g$b;->h:Z

    .line 46
    iget-object v0, p0, Lb/b/p/g$b;->a:Landroid/view/Menu;

    iget v1, p0, Lb/b/p/g$b;->b:I

    iget v2, p0, Lb/b/p/g$b;->i:I

    iget v3, p0, Lb/b/p/g$b;->j:I

    iget-object v4, p0, Lb/b/p/g$b;->k:Ljava/lang/CharSequence;

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/b/p/g$b;->a(Landroid/view/MenuItem;)V

    return-void
.end method

.method public a(Landroid/util/AttributeSet;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v0, v0, Lb/b/p/g;->c:Landroid/content/Context;

    sget-object v1, Lb/b/j;->MenuGroup:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 2
    sget v0, Lb/b/j;->MenuGroup_android_id:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->b:I

    .line 3
    sget v0, Lb/b/j;->MenuGroup_android_menuCategory:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->c:I

    .line 4
    sget v0, Lb/b/j;->MenuGroup_android_orderInCategory:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->d:I

    .line 5
    sget v0, Lb/b/j;->MenuGroup_android_checkableBehavior:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->e:I

    .line 6
    sget v0, Lb/b/j;->MenuGroup_android_visible:I

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lb/b/p/g$b;->f:Z

    .line 7
    sget v0, Lb/b/j;->MenuGroup_android_enabled:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lb/b/p/g$b;->g:Z

    .line 8
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public final a(Landroid/view/MenuItem;)V
    .registers 7

    .line 10
    iget-boolean v0, p0, Lb/b/p/g$b;->s:Z

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    move-result-object v0

    iget-boolean v1, p0, Lb/b/p/g$b;->t:Z

    .line 11
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    move-result-object v0

    iget-boolean v1, p0, Lb/b/p/g$b;->u:Z

    .line 12
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v0

    iget v1, p0, Lb/b/p/g$b;->r:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v1, v3, :cond_1a

    const/4 v1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    .line 13
    :goto_1b
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lb/b/p/g$b;->l:Ljava/lang/CharSequence;

    .line 14
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    iget v1, p0, Lb/b/p/g$b;->m:I

    .line 15
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 16
    iget v0, p0, Lb/b/p/g$b;->v:I

    if-ltz v0, :cond_31

    .line 17
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 18
    :cond_31
    iget-object v0, p0, Lb/b/p/g$b;->z:Ljava/lang/String;

    if-eqz v0, :cond_58

    .line 19
    iget-object v0, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v0, v0, Lb/b/p/g;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-nez v0, :cond_50

    .line 20
    new-instance v0, Lb/b/p/g$a;

    iget-object v1, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    .line 21
    invoke-virtual {v1}, Lb/b/p/g;->a()Ljava/lang/Object;

    move-result-object v1

    iget-object v4, p0, Lb/b/p/g$b;->z:Ljava/lang/String;

    invoke-direct {v0, v1, v4}, Lb/b/p/g$a;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto :goto_58

    .line 23
    :cond_50
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "The android:onClick attribute cannot be used within a restricted context"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_58
    :goto_58
    iget v0, p0, Lb/b/p/g$b;->r:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_72

    .line 25
    instance-of v0, p1, Lb/b/p/j/i;

    if-eqz v0, :cond_68

    .line 26
    move-object v0, p1

    check-cast v0, Lb/b/p/j/i;

    invoke-virtual {v0, v3}, Lb/b/p/j/i;->c(Z)V

    goto :goto_72

    .line 27
    :cond_68
    instance-of v0, p1, Lb/b/p/j/j;

    if-eqz v0, :cond_72

    .line 28
    move-object v0, p1

    check-cast v0, Lb/b/p/j/j;

    invoke-virtual {v0, v3}, Lb/b/p/j/j;->a(Z)V

    .line 29
    :cond_72
    :goto_72
    iget-object v0, p0, Lb/b/p/g$b;->x:Ljava/lang/String;

    if-eqz v0, :cond_86

    .line 30
    sget-object v1, Lb/b/p/g;->e:[Ljava/lang/Class;

    iget-object v2, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v2, v2, Lb/b/p/g;->a:[Ljava/lang/Object;

    invoke-virtual {p0, v0, v1, v2}, Lb/b/p/g$b;->a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 31
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    const/4 v2, 0x1

    .line 32
    :cond_86
    iget v0, p0, Lb/b/p/g$b;->w:I

    if-lez v0, :cond_97

    if-nez v2, :cond_90

    .line 33
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    goto :goto_97

    :cond_90
    const-string v0, "SupportMenuInflater"

    const-string v1, "Ignoring attribute \'itemActionViewLayout\'. Action view already specified."

    .line 34
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :cond_97
    :goto_97
    iget-object v0, p0, Lb/b/p/g$b;->A:Lb/h/m/b;

    if-eqz v0, :cond_9e

    .line 36
    invoke-static {p1, v0}, Lb/h/m/i;->a(Landroid/view/MenuItem;Lb/h/m/b;)Landroid/view/MenuItem;

    .line 37
    :cond_9e
    iget-object v0, p0, Lb/b/p/g$b;->B:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Lb/h/m/i;->a(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    .line 38
    iget-object v0, p0, Lb/b/p/g$b;->C:Ljava/lang/CharSequence;

    invoke-static {p1, v0}, Lb/h/m/i;->b(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V

    .line 39
    iget-char v0, p0, Lb/b/p/g$b;->n:C

    iget v1, p0, Lb/b/p/g$b;->o:I

    invoke-static {p1, v0, v1}, Lb/h/m/i;->a(Landroid/view/MenuItem;CI)V

    .line 40
    iget-char v0, p0, Lb/b/p/g$b;->p:C

    iget v1, p0, Lb/b/p/g$b;->q:I

    invoke-static {p1, v0, v1}, Lb/h/m/i;->b(Landroid/view/MenuItem;CI)V

    .line 41
    iget-object v0, p0, Lb/b/p/g$b;->E:Landroid/graphics/PorterDuff$Mode;

    if-eqz v0, :cond_bd

    .line 42
    invoke-static {p1, v0}, Lb/h/m/i;->a(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)V

    .line 43
    :cond_bd
    iget-object v0, p0, Lb/b/p/g$b;->D:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_c4

    .line 44
    invoke-static {p1, v0}, Lb/h/m/i;->a(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)V

    :cond_c4
    return-void
.end method

.method public b()Landroid/view/SubMenu;
    .registers 6

    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lb/b/p/g$b;->h:Z

    .line 43
    iget-object v0, p0, Lb/b/p/g$b;->a:Landroid/view/Menu;

    iget v1, p0, Lb/b/p/g$b;->b:I

    iget v2, p0, Lb/b/p/g$b;->i:I

    iget v3, p0, Lb/b/p/g$b;->j:I

    iget-object v4, p0, Lb/b/p/g$b;->k:Ljava/lang/CharSequence;

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v0

    .line 44
    invoke-interface {v0}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {p0, v1}, Lb/b/p/g$b;->a(Landroid/view/MenuItem;)V

    return-object v0
.end method

.method public b(Landroid/util/AttributeSet;)V
    .registers 8

    .line 1
    iget-object v0, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v0, v0, Lb/b/p/g;->c:Landroid/content/Context;

    sget-object v1, Lb/b/j;->MenuItem:[I

    invoke-static {v0, p1, v1}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object p1

    .line 2
    sget v0, Lb/b/j;->MenuItem_android_id:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->i:I

    .line 3
    sget v0, Lb/b/j;->MenuItem_android_menuCategory:I

    iget v2, p0, Lb/b/p/g$b;->c:I

    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->d(II)I

    move-result v0

    .line 4
    sget v2, Lb/b/j;->MenuItem_android_orderInCategory:I

    iget v3, p0, Lb/b/p/g$b;->d:I

    invoke-virtual {p1, v2, v3}, Lb/b/q/g0;->d(II)I

    move-result v2

    const/high16 v3, -0x10000

    and-int/2addr v0, v3

    const v3, 0xffff

    and-int/2addr v2, v3

    or-int/2addr v0, v2

    .line 5
    iput v0, p0, Lb/b/p/g$b;->j:I

    .line 6
    sget v0, Lb/b/j;->MenuItem_android_title:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->k:Ljava/lang/CharSequence;

    .line 7
    sget v0, Lb/b/j;->MenuItem_android_titleCondensed:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->l:Ljava/lang/CharSequence;

    .line 8
    sget v0, Lb/b/j;->MenuItem_android_icon:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->m:I

    .line 9
    sget v0, Lb/b/j;->MenuItem_android_alphabeticShortcut:I

    .line 10
    invoke-virtual {p1, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/b/p/g$b;->a(Ljava/lang/String;)C

    move-result v0

    iput-char v0, p0, Lb/b/p/g$b;->n:C

    .line 11
    sget v0, Lb/b/j;->MenuItem_alphabeticModifiers:I

    const/16 v2, 0x1000

    .line 12
    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->d(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->o:I

    .line 13
    sget v0, Lb/b/j;->MenuItem_android_numericShortcut:I

    .line 14
    invoke-virtual {p1, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb/b/p/g$b;->a(Ljava/lang/String;)C

    move-result v0

    iput-char v0, p0, Lb/b/p/g$b;->p:C

    .line 15
    sget v0, Lb/b/j;->MenuItem_numericModifiers:I

    .line 16
    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->d(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->q:I

    .line 17
    sget v0, Lb/b/j;->MenuItem_android_checkable:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_80

    .line 18
    sget v0, Lb/b/j;->MenuItem_android_checkable:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->a(IZ)Z

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->r:I

    goto :goto_84

    .line 19
    :cond_80
    iget v0, p0, Lb/b/p/g$b;->e:I

    iput v0, p0, Lb/b/p/g$b;->r:I

    .line 20
    :goto_84
    sget v0, Lb/b/j;->MenuItem_android_checked:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->a(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lb/b/p/g$b;->s:Z

    .line 21
    sget v0, Lb/b/j;->MenuItem_android_visible:I

    iget-boolean v2, p0, Lb/b/p/g$b;->f:Z

    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->a(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lb/b/p/g$b;->t:Z

    .line 22
    sget v0, Lb/b/j;->MenuItem_android_enabled:I

    iget-boolean v2, p0, Lb/b/p/g$b;->g:Z

    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->a(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lb/b/p/g$b;->u:Z

    .line 23
    sget v0, Lb/b/j;->MenuItem_showAsAction:I

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->d(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->v:I

    .line 24
    sget v0, Lb/b/j;->MenuItem_android_onClick:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->z:Ljava/lang/String;

    .line 25
    sget v0, Lb/b/j;->MenuItem_actionLayout:I

    invoke-virtual {p1, v0, v1}, Lb/b/q/g0;->g(II)I

    move-result v0

    iput v0, p0, Lb/b/p/g$b;->w:I

    .line 26
    sget v0, Lb/b/j;->MenuItem_actionViewClass:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->x:Ljava/lang/String;

    .line 27
    sget v0, Lb/b/j;->MenuItem_actionProviderClass:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->d(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->y:Ljava/lang/String;

    if-eqz v0, :cond_cd

    const/4 v0, 0x1

    goto :goto_ce

    :cond_cd
    const/4 v0, 0x0

    :goto_ce
    const/4 v3, 0x0

    if-eqz v0, :cond_ea

    .line 28
    iget v4, p0, Lb/b/p/g$b;->w:I

    if-nez v4, :cond_ea

    iget-object v4, p0, Lb/b/p/g$b;->x:Ljava/lang/String;

    if-nez v4, :cond_ea

    .line 29
    iget-object v0, p0, Lb/b/p/g$b;->y:Ljava/lang/String;

    sget-object v4, Lb/b/p/g;->f:[Ljava/lang/Class;

    iget-object v5, p0, Lb/b/p/g$b;->F:Lb/b/p/g;

    iget-object v5, v5, Lb/b/p/g;->b:[Ljava/lang/Object;

    invoke-virtual {p0, v0, v4, v5}, Lb/b/p/g$b;->a(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/b;

    iput-object v0, p0, Lb/b/p/g$b;->A:Lb/h/m/b;

    goto :goto_f5

    :cond_ea
    if-eqz v0, :cond_f3

    const-string v0, "SupportMenuInflater"

    const-string v4, "Ignoring attribute \'actionProviderClass\'. Action view already specified."

    .line 30
    invoke-static {v0, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    :cond_f3
    iput-object v3, p0, Lb/b/p/g$b;->A:Lb/h/m/b;

    .line 32
    :goto_f5
    sget v0, Lb/b/j;->MenuItem_contentDescription:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->B:Ljava/lang/CharSequence;

    .line 33
    sget v0, Lb/b/j;->MenuItem_tooltipText:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->e(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->C:Ljava/lang/CharSequence;

    .line 34
    sget v0, Lb/b/j;->MenuItem_iconTintMode:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_11c

    .line 35
    sget v0, Lb/b/j;->MenuItem_iconTintMode:I

    invoke-virtual {p1, v0, v2}, Lb/b/q/g0;->d(II)I

    move-result v0

    iget-object v2, p0, Lb/b/p/g$b;->E:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v0, v2}, Lb/b/q/q;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->E:Landroid/graphics/PorterDuff$Mode;

    goto :goto_11e

    .line 36
    :cond_11c
    iput-object v3, p0, Lb/b/p/g$b;->E:Landroid/graphics/PorterDuff$Mode;

    .line 37
    :goto_11e
    sget v0, Lb/b/j;->MenuItem_iconTint:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->g(I)Z

    move-result v0

    if-eqz v0, :cond_12f

    .line 38
    sget v0, Lb/b/j;->MenuItem_iconTint:I

    invoke-virtual {p1, v0}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lb/b/p/g$b;->D:Landroid/content/res/ColorStateList;

    goto :goto_131

    .line 39
    :cond_12f
    iput-object v3, p0, Lb/b/p/g$b;->D:Landroid/content/res/ColorStateList;

    .line 40
    :goto_131
    invoke-virtual {p1}, Lb/b/q/g0;->b()V

    .line 41
    iput-boolean v1, p0, Lb/b/p/g$b;->h:Z

    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/b/p/g$b;->h:Z

    return v0
.end method

.method public d()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/b/p/g$b;->b:I

    .line 2
    iput v0, p0, Lb/b/p/g$b;->c:I

    .line 3
    iput v0, p0, Lb/b/p/g$b;->d:I

    .line 4
    iput v0, p0, Lb/b/p/g$b;->e:I

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lb/b/p/g$b;->f:Z

    .line 6
    iput-boolean v0, p0, Lb/b/p/g$b;->g:Z

    return-void
.end method
