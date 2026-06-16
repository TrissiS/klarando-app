.class public final Lb/h/d/b$d;
.super Ljava/lang/Object;
.source "ActivityRecreator.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/d/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public h:Ljava/lang/Object;

.field public i:Landroid/app/Activity;

.field public final j:I

.field public k:Z

.field public l:Z

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lb/h/d/b$d;->k:Z

    .line 3
    iput-boolean v0, p0, Lb/h/d/b$d;->l:Z

    .line 4
    iput-boolean v0, p0, Lb/h/d/b$d;->m:Z

    .line 5
    iput-object p1, p0, Lb/h/d/b$d;->i:Landroid/app/Activity;

    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    iput p1, p0, Lb/h/d/b$d;->j:I

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/d/b$d;->i:Landroid/app/Activity;

    if-ne v0, p1, :cond_a

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/h/d/b$d;->i:Landroid/app/Activity;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lb/h/d/b$d;->l:Z

    :cond_a
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 4

    .line 1
    iget-boolean v0, p0, Lb/h/d/b$d;->l:Z

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lb/h/d/b$d;->m:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p0, Lb/h/d/b$d;->k:Z

    if-nez v0, :cond_1c

    iget-object v0, p0, Lb/h/d/b$d;->h:Ljava/lang/Object;

    iget v1, p0, Lb/h/d/b$d;->j:I

    .line 2
    invoke-static {v0, v1, p1}, Lb/h/d/b;->a(Ljava/lang/Object;ILandroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_1c

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lb/h/d/b$d;->m:Z

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lb/h/d/b$d;->h:Ljava/lang/Object;

    :cond_1c
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/d/b$d;->i:Landroid/app/Activity;

    if-ne v0, p1, :cond_7

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lb/h/d/b$d;->k:Z

    :cond_7
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
