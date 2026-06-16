.class public Lc/a/a/a/p0/h$c$a;
.super Ljava/lang/Object;
.source "PasswordToggleEndIconDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/h$c;->a(Lcom/google/android/material/textfield/TextInputLayout;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/widget/EditText;

.field public final synthetic i:Lc/a/a/a/p0/h$c;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/h$c;Landroid/widget/EditText;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/h$c$a;->i:Lc/a/a/a/p0/h$c;

    iput-object p2, p0, Lc/a/a/a/p0/h$c$a;->h:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/h$c$a;->h:Landroid/widget/EditText;

    iget-object v1, p0, Lc/a/a/a/p0/h$c$a;->i:Lc/a/a/a/p0/h$c;

    iget-object v1, v1, Lc/a/a/a/p0/h$c;->a:Lc/a/a/a/p0/h;

    invoke-static {v1}, Lc/a/a/a/p0/h;->b(Lc/a/a/a/p0/h;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method
