.class public final synthetic Ld/a/a/a;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic h:Lnet/nyx/base/BaseActivity;


# direct methods
.method public synthetic constructor <init>(Lnet/nyx/base/BaseActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld/a/a/a;->h:Lnet/nyx/base/BaseActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Ld/a/a/a;->h:Lnet/nyx/base/BaseActivity;

    invoke-virtual {v0, p1}, Lnet/nyx/base/BaseActivity;->c(Landroid/view/View;)V

    return-void
.end method
