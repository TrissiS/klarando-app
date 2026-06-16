.class public abstract Lb/h/m/b;
.super Ljava/lang/Object;
.source "ActionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/m/b$b;,
        Lb/h/m/b$a;
    }
.end annotation


# instance fields
.field public a:Lb/h/m/b$a;

.field public b:Lb/h/m/b$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/h/m/b;->c()Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/SubMenu;)V
    .registers 2

    return-void
.end method

.method public a(Lb/h/m/b$a;)V
    .registers 2

    .line 4
    iput-object p1, p0, Lb/h/m/b;->a:Lb/h/m/b$a;

    return-void
.end method

.method public a(Lb/h/m/b$b;)V
    .registers 4

    .line 5
    iget-object v0, p0, Lb/h/m/b;->b:Lb/h/m/b$b;

    if-eqz v0, :cond_29

    if-eqz p1, :cond_29

    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setVisibilityListener: Setting a new ActionProvider.VisibilityListener when one is already set. Are you reusing this "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " instance while it is still in use somewhere else?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ActionProvider(support)"

    .line 8
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    :cond_29
    iput-object p1, p0, Lb/h/m/b;->b:Lb/h/m/b$b;

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/h/m/b;->a:Lb/h/m/b$a;

    if-eqz v0, :cond_7

    .line 3
    invoke-interface {v0, p1}, Lb/h/m/b$a;->b(Z)V

    :cond_7
    return-void
.end method

.method public a()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public b()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public abstract c()Landroid/view/View;
.end method

.method public d()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public e()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public f()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lb/h/m/b;->b:Lb/h/m/b$b;

    .line 2
    iput-object v0, p0, Lb/h/m/b;->a:Lb/h/m/b$a;

    return-void
.end method
