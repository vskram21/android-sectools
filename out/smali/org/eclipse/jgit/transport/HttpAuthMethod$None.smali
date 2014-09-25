.class Lorg/eclipse/jgit/transport/HttpAuthMethod$None;
.super Lorg/eclipse/jgit/transport/HttpAuthMethod;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/HttpAuthMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "None"
.end annotation


# static fields
.field static final INSTANCE:Lorg/eclipse/jgit/transport/HttpAuthMethod$None;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 264
    new-instance v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$None;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod$None;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$None;->INSTANCE:Lorg/eclipse/jgit/transport/HttpAuthMethod$None;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 266
    sget-object v0, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod;-><init>(Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;)V

    .line 267
    return-void
.end method


# virtual methods
.method authorize(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "user"
    .parameter "pass"

    .prologue
    .line 272
    return-void
.end method

.method configureRequest(Lorg/eclipse/jgit/transport/http/HttpConnection;)V
    .locals 0
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    return-void
.end method
