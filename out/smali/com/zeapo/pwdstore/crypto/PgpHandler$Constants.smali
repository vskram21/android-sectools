.class public final Lcom/zeapo/pwdstore/crypto/PgpHandler$Constants;
.super Ljava/lang/Object;
.source "PgpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zeapo/pwdstore/crypto/PgpHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Constants"
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "Keychain"


# instance fields
.field final synthetic this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;


# direct methods
.method public constructor <init>(Lcom/zeapo/pwdstore/crypto/PgpHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 75
    iput-object p1, p0, Lcom/zeapo/pwdstore/crypto/PgpHandler$Constants;->this$0:Lcom/zeapo/pwdstore/crypto/PgpHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
