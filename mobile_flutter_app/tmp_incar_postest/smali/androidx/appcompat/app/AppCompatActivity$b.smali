.class public Landroidx/appcompat/app/AppCompatActivity$b;
.super Ljava/lang/Object;
.source "AppCompatActivity.java"

# interfaces
.implements Lb/a/d/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/app/AppCompatActivity;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/appcompat/app/AppCompatActivity;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/AppCompatActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/AppCompatActivity$b;->a:Landroidx/appcompat/app/AppCompatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .registers 4

    .line 1
    iget-object p1, p0, Landroidx/appcompat/app/AppCompatActivity$b;->a:Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->q()Lb/b/k/c;

    move-result-object p1

    .line 2
    invoke-virtual {p1}, Lb/b/k/c;->d()V

    .line 3
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatActivity$b;->a:Landroidx/appcompat/app/AppCompatActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->c()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    const-string v1, "androidx:appcompat"

    .line 4
    invoke-virtual {v0, v1}, Landroidx/savedstate/SavedStateRegistry;->a(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 5
    invoke-virtual {p1, v0}, Lb/b/k/c;->a(Landroid/os/Bundle;)V

    return-void
.end method
