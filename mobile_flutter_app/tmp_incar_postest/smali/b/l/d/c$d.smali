.class public Lb/l/d/c$d;
.super Ljava/lang/Object;
.source "DialogFragment.java"

# interfaces
.implements Lb/n/n;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/l/d/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lb/n/n<",
        "Lb/n/h;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lb/l/d/c;


# direct methods
.method public constructor <init>(Lb/l/d/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;)V
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    if-eqz p1, :cond_5b

    .line 2
    iget-object p1, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    invoke-static {p1}, Lb/l/d/c;->c(Lb/l/d/c;)Z

    move-result p1

    if-eqz p1, :cond_5b

    .line 3
    iget-object p1, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object p1

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_53

    .line 5
    iget-object v0, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    invoke-static {v0}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_5b

    const/4 v0, 0x3

    .line 6
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DialogFragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " setting the content view on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    .line 8
    invoke-static {v1}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    :cond_49
    iget-object v0, p0, Lb/l/d/c$d;->a:Lb/l/d/c;

    invoke-static {v0}, Lb/l/d/c;->a(Lb/l/d/c;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    goto :goto_5b

    .line 11
    :cond_53
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "DialogFragment can not be attached to a container view"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5b
    :goto_5b
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .line 1
    check-cast p1, Lb/n/h;

    invoke-virtual {p0, p1}, Lb/l/d/c$d;->a(Lb/n/h;)V

    return-void
.end method
