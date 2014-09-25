.class public interface abstract Lcom/jcraft/jsch/ConfigRepository;
.super Ljava/lang/Object;
.source "ConfigRepository.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/ConfigRepository$Config;
    }
.end annotation


# static fields
.field public static final defaultConfig:Lcom/jcraft/jsch/ConfigRepository$Config;

.field public static final nullConfig:Lcom/jcraft/jsch/ConfigRepository;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Lcom/jcraft/jsch/ConfigRepository$1;

    invoke-direct {v0}, Lcom/jcraft/jsch/ConfigRepository$1;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/ConfigRepository;->defaultConfig:Lcom/jcraft/jsch/ConfigRepository$Config;

    .line 52
    new-instance v0, Lcom/jcraft/jsch/ConfigRepository$2;

    invoke-direct {v0}, Lcom/jcraft/jsch/ConfigRepository$2;-><init>()V

    sput-object v0, Lcom/jcraft/jsch/ConfigRepository;->nullConfig:Lcom/jcraft/jsch/ConfigRepository;

    return-void
.end method


# virtual methods
.method public abstract getConfig(Ljava/lang/String;)Lcom/jcraft/jsch/ConfigRepository$Config;
.end method
