.class public final synthetic Ld/a/b/f/a/a0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic h:Lnet/nyx/postest/ui/activity/ScanResultActivity;

.field private final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/postest/ui/activity/ScanResultActivity;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/b/f/a/a0;->h:Lnet/nyx/postest/ui/activity/ScanResultActivity;

    iput-object p2, p0, Ld/a/b/f/a/a0;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Ld/a/b/f/a/a0;->h:Lnet/nyx/postest/ui/activity/ScanResultActivity;

    iget-object v1, p0, Ld/a/b/f/a/a0;->i:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lnet/nyx/postest/ui/activity/ScanResultActivity;->b(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
