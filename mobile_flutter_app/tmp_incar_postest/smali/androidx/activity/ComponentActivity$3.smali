.class public Landroidx/activity/ComponentActivity$3;
.super Ljava/lang/Object;
.source "ComponentActivity.java"

# interfaces
.implements Lb/n/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/ComponentActivity;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/activity/ComponentActivity;


# direct methods
.method public constructor <init>(Landroidx/activity/ComponentActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/activity/ComponentActivity$3;->a:Landroidx/activity/ComponentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 3

    .line 1
    sget-object p1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    if-ne p2, p1, :cond_17

    .line 2
    iget-object p1, p0, Landroidx/activity/ComponentActivity$3;->a:Landroidx/activity/ComponentActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 3
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object p1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    if-eqz p1, :cond_17

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->cancelPendingInputEvents()V

    :cond_17
    return-void
.end method
