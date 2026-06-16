.class public Lnet/nyx/postest/ui/activity/LcdActivity$b;
.super Ld/a/b/b/a;
.source "LcdActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/nyx/postest/ui/activity/LcdActivity;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic k:Lnet/nyx/postest/ui/activity/LcdActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$b;->k:Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-direct {p0}, Ld/a/b/b/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity$b;->k:Lnet/nyx/postest/ui/activity/LcdActivity;

    iget-object p1, p1, Lnet/nyx/postest/ui/activity/LcdActivity;->I:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method
