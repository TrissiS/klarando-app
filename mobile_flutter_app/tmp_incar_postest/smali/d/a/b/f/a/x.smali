.class public final synthetic Ld/a/b/f/a/x;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/PrintActivity;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/x;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Ld/a/b/f/a/x;->h:Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-virtual {v0, p1}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(Landroid/view/View;)V

    return-void
.end method
