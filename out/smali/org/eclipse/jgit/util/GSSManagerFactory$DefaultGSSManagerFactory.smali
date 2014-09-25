.class Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;
.super Lorg/eclipse/jgit/util/GSSManagerFactory;
.source "GSSManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/GSSManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DefaultGSSManagerFactory"
.end annotation


# static fields
.field private static final INSTANCE:Lorg/ietf/jgss/GSSManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;->INSTANCE:Lorg/ietf/jgss/GSSManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/eclipse/jgit/util/GSSManagerFactory;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/util/GSSManagerFactory$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 83
    invoke-direct {p0}, Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public newInstance(Ljava/net/URL;)Lorg/ietf/jgss/GSSManager;
    .locals 1
    .parameter "url"

    .prologue
    .line 88
    sget-object v0, Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;->INSTANCE:Lorg/ietf/jgss/GSSManager;

    return-object v0
.end method
