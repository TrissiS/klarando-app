.class public Lc/a/a/a/p0/a$d$a;
.super Ljava/lang/Object;
.source "ClearTextEndIconDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/a$d;->a(Lcom/google/android/material/textfield/TextInputLayout;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/widget/EditText;

.field public final synthetic i:Lc/a/a/a/p0/a$d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/a$d;Landroid/widget/EditText;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/a$d$a;->i:Lc/a/a/a/p0/a$d;

    iput-object p2, p0, Lc/a/a/a/p0/a$d$a;->h:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/a$d$a;->h:Landroid/widget/EditText;

    iget-object v1, p0, Lc/a/a/a/p0/a$d$a;->i:Lc/a/a/a/p0/a$d;

    iget-object v1, v1, Lc/a/a/a/p0/a$d;->a:Lc/a/a/a/p0/a;

    invoke-static {v1}, Lc/a/a/a/p0/a;->b(Lc/a/a/a/p0/a;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method
