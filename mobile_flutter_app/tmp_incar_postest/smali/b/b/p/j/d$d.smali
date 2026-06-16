.class public Lb/b/p/j/d$d;
.super Ljava/lang/Object;
.source "CascadingMenuPopup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/p/j/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Lb/b/q/v;

.field public final b:Lb/b/p/j/g;

.field public final c:I


# direct methods
.method public constructor <init>(Lb/b/q/v;Lb/b/p/j/g;I)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/b/p/j/d$d;->a:Lb/b/q/v;

    .line 3
    iput-object p2, p0, Lb/b/p/j/d$d;->b:Lb/b/p/j/g;

    .line 4
    iput p3, p0, Lb/b/p/j/d$d;->c:I

    return-void
.end method


# virtual methods
.method public a()Landroid/widget/ListView;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/d$d;->a:Lb/b/q/v;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ListPopupWindow;->f()Landroid/widget/ListView;

    move-result-object v0

    return-object v0
.end method
