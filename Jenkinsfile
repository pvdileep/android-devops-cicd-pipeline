pipeline {
    agent any

    environment {
        ANDROID_HOME = "/opt/android-sdk"
        ANDROID_SDK_ROOT = "/opt/android-sdk"
        PATH = "$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/pvdileep/android-cicd-pipeline.git'
            }
        }

        stage('Build APK') {
            steps {
                sh '''
                chmod +x gradlew
                ./gradlew clean assembleDebug
                '''
            }
        }

        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'app/build/outputs/apk/debug/*.apk', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Android APK Build Successful!'
        }
        failure {
            echo 'Android APK Build Failed!'
        }
    }
}
